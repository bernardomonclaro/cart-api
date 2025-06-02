class UpdateCartItemQuantityService
  Result = Struct.new(:success?, :cart, :error, :status)

  def self.call(cart, params)
    product_id = params[:product_id]
    quantity = params[:quantity]

    return Result.new(false, nil, "product_id and quantity are required", :bad_request) unless product_id && quantity

    cart_item = cart.cart_items.find_by(product_id: product_id)
    return Result.new(false, nil, "Product not found in cart", :not_found) unless cart_item

    cart_item.update!(quantity: quantity)

    cart.touch(:last_interaction_at)
    cart.update_total_price!

    Result.new(true, cart)
  rescue => e
    Result.new(false, nil, e.message, :unprocessable_entity)
  end
end
