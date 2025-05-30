class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :quantity, numericality: { greater_than: 0 }
  validates :unit_price, numericality: { greater_than_or_equal_to: 0 }

  before_validation :set_unit_price

  def total_price
    unit_price * quantity
  end

  private

  def set_unit_price
    self.unit_price ||= product.price
  end
end