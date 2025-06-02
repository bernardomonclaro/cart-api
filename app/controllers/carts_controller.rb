class CartsController < ApplicationController
  def list_products
    render json: CartSerializer.new(current_cart).as_json
  end

  def add_product
    result = AddProductToCartService.call(current_cart, params)

    if result.success?
      render json: CartSerializer.new(result.cart).as_json
    else
      render json: { error: result.error }, status: result.status
    end
  end

  def update_quantity
    result = UpdateCartItemQuantityService.call(current_cart, params)

    if result.success?
      render json: CartSerializer.new(result.cart).as_json
    else
      render json: { error: result.error }, status: result.status
    end
  end

  def remove_product
    result = RemoveProductFromCartService.call(current_cart, params)

    if result.success?
      render json: CartSerializer.new(result.cart).as_json
    else
      render json: { error: result.error }, status: result.status
    end
  end

  private

  def current_cart
    session[:cart_id] ||= Cart.create!(last_interaction_at: Time.current).id
    Cart.find(session[:cart_id])
  end
end

