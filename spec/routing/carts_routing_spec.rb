require "rails_helper"

RSpec.describe CartsController, type: :routing do
  describe 'routes' do
    it 'routes to #add_product' do
      expect(post: '/cart/add_product').to route_to('carts#add_product')
    end

    it 'routes to #list_products' do
      expect(get: '/cart/list_products').to route_to('carts#list_products')
    end

    it 'routes to #update_quantity' do
      expect(patch: '/cart/update_quantity').to route_to('carts#update_quantity')
    end

    it 'routes to #remove_product' do
      expect(delete: '/cart/remove_product').to route_to('carts#remove_product')
    end
  end
end