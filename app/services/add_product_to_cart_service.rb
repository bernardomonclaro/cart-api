class AddProductToCartService
  Result = Struct.new(:success?, :cart, :error, :status)

  def self.call(cart, params)
    product_id = params[:product_id]
    quantity = params[:quantity].to_i

    return Result.new(false, nil, "product_id and quantity are required", :bad_request) unless product_id && quantity > 0

    product = Product.find_by(id: product_id)
    return Result.new(false, nil, "Product not found", :not_found) unless product

    cart_item = cart.cart_items.find_or_initialize_by(product: product)
    cart_item.quantity = (cart_item.quantity || 0) + quantity
    cart_item.unit_price ||= product.price
    cart_item.save!

    cart.touch(:last_interaction_at)
    cart.update_total_price!

    Result.new(true, cart)
  rescue => e
    Result.new(false, nil, e.message, :unprocessable_entity)
  end
end
