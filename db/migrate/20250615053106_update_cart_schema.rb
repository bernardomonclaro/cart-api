class UpdateCartSchema < ActiveRecord::Migration[7.1]
  def change
    # cart_items
    remove_column :cart_items, :unit_price, :decimal, precision: 17, scale: 2
    change_column_default :cart_items, :quantity, from: nil, to: 1

    # carts
    remove_column :carts, :abandoned_at, :datetime
    add_column :carts, :abandoned, :boolean, default: false
  end
end

