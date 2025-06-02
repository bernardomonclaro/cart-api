class RemoveProductFromCartService
  Result = Struct.new(:success?, :cart, :error, :status)

  def self.call(cart, params)
    product_id = params[:product_id]
    return Result.new(false, nil, "product_id is required", :bad_request) unless product_id

    cart_item = cart.cart_items.find_by(product_id: product_id)
    return Result.new(false, nil, "Product not found in cart", :not_found) unless cart_item

    cart_item.destroy!

    cart.touch(:last_interaction_at)
    cart.update_total_price!

    Result.new(true, cart)
  rescue => e
    Result.new(false, nil, e.message, :unprocessable_entity)
  end
end