class Cart < ApplicationRecord
  validates :total_price, numericality: { greater_than_or_equal_to: 0 }
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  # Update the total cart price based on cart_items
  def update_total_price!
    self.total_price = cart_items.sum('quantity * unit_price')
    save!
  end

  # Mark as abandoned if there has been no interaction in the last 3 hours
  def mark_as_abandoned
    if last_interaction_at.present? && last_interaction_at < 3.hours.ago && abandoned_at.nil?
      update(abandoned_at: Time.current)
    end
  end

  # Check if it is abandoned
  def abandoned?
    abandoned_at.present?
  end
  
  # Remove if abandoned for more than 7 days
  def remove_if_abandoned
    destroy if abandoned_at.present? && abandoned_at < 7.days.ago
  end
end
