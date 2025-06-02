require 'rails_helper'

RSpec.describe "/cart", type: :request do
  let(:product) { create(:product) }
  
  describe "POST /add_product" do
    context 'when the product is not already in the cart' do
      it 'adds a new product to the cart' do
        expect {
          post '/cart/add_product', params: { product_id: product.id, quantity: 2 }, as: :json
        }.to change { CartItem.count }.by(1)
      end
      it 'returns the updated cart with correct total price' do
        post '/cart/add_product', params: { product_id: product.id, quantity: 2 }, as: :json
        json = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
        expect(json["products"].first["quantity"]).to eq(2)
        expect(json["total_price"]).to eq(20.0)
      end
    end
    
    context 'when the product is already in the cart' do
      before do
        post '/cart/add_product', params: { product_id: product.id, quantity: 1 }, as: :json
      end
      
      it 'updates the quantity of the existing item in the cart' do
        expect {
          post '/cart/add_product', params: { product_id: product.id, quantity: 2 }, as: :json
        }.to change {
          CartItem.find_by(product_id: product.id).reload.quantity
        }.by(2)
      end

      it 'returns the updated cart with correct total price' do
        post '/cart/add_product', params: { product_id: product.id, quantity: 2 }, as: :json
        json = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
        expect(json["products"].first["quantity"]).to eq(3)
        expect(json["total_price"]).to eq(30.0)
      end
    end
  end

  describe "PATCH /update_quantity" do
    before do
      post '/cart/add_product', params: { product_id: product.id, quantity: 1 }, as: :json
    end
    
    it 'updates the quantity of an existing item in the cart' do
      patch '/cart/update_quantity', params: { product_id: product.id, quantity: 3 }, as: :json
      json = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(json["products"].first["quantity"]).to eq(3)
      expect(json["total_price"]).to eq(30.0)
    end

    it 'returns an error if the product is not in the cart' do
      patch '/cart/update_quantity', params: { product_id: -1, quantity: 2 }, as: :json
      expect(response).to have_http_status(:not_found)
    end
  end
  
  describe "DELETE /remove_product" do
    before do
      post '/cart/add_product', params: { product_id: product.id, quantity: 1 }, as: :json
    end

    it 'removes a product from the cart' do
      delete '/cart/remove_product', params: { product_id: product.id }, as: :json
      expect(response).to have_http_status(:success)
      expect(CartItem.find_by(product_id: product.id)).to be_nil
    end

    it 'returns an error if the product is not in the cart' do
      delete '/cart/remove_product', params: { product_id: -1 }, as: :json
      expect(response).to have_http_status(:not_found)
    end
  end
  
  describe "GET /list_products" do
    before do
      post '/cart/add_product', params: { product_id: product.id, quantity: 1 }, as: :json
    end

    it 'lists all products in the cart' do
      get '/cart/list_products', as: :json
      json = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(json["products"].length).to eq(1)
      expect(json["products"].first["name"]).to eq("Test Product")
      expect(json["total_price"]).to eq(10.0)
    end
  end
end
