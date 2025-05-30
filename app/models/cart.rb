class Cart < ApplicationRecord
  validates :total_price, numericality: { greater_than_or_equal_to: 0 }
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  def update_total_price!
    update!(total_price: cart_items.sum(&:total_price))
  end
end
