class CartsController < ApplicationController
  def list_products
    cart = current_cart
    render json: serialize_cart(cart)
  end

  def add_product
    cart = current_cart
    product = Product.find(params[:product_id])
    quantity = params[:quantity].to_i

    raise "Invalid quantity" if quantity <= 0

    cart_item = cart.cart_items.find_or_initialize_by(product: product)
    cart_item.quantity = (cart_item.quantity || 0) + quantity
    cart_item.unit_price ||= product.price
    cart_item.save!

    cart.touch(:last_interaction_at)
    cart.update_total_price!

    render json: serialize_cart(cart)
  end


  def update_quantity
    cart = current_cart
    cart_item = cart.cart_items.find_by(product_id: params[:product_id])
    return render json: { error: 'Product not found in cart' }, status: :not_found unless cart_item
    cart_item.update!(quantity: params[:quantity])

    cart.touch(:last_interaction_at)
    cart.update_total_price!

    render json: serialize_cart(cart)
  end

  def remove_product
    cart = current_cart
    cart_item = cart.cart_items.find_by(product_id: params[:product_id])
    return render json: { error: 'Product not found in cart' }, status: :not_found unless cart_item

    cart_item.destroy!
    cart.touch(:last_interaction_at)
    cart.update_total_price!

    render json: serialize_cart(cart)
  end

  private

  def current_cart
    session[:cart_id] ||= Cart.create!(last_interaction_at: Time.current).id
    Cart.find(session[:cart_id])
  end

  def serialize_cart(cart)
    {
      id: cart.id,
      products: cart.cart_items.includes(:product).map do |item|
        {
          id: item.product.id,
          name: item.product.name,
          quantity: item.quantity,
          unit_price: item.unit_price.to_f,
          total_price: item.total_price.to_f
        }
      end,
      total_price: cart.total_price.to_f
    }
  end
end
