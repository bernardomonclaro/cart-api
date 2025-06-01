class MarkCartAsAbandonedJob
  include Sidekiq::Job

  def perform(*args)
    # Marks carts that have been inactive for more than 3 hours as abandoned
    Cart.where(abandoned_at: nil)
        .where("last_interaction_at < ?", 3.hours.ago)
        .find_each do |cart|
          cart.mark_as_abandoned
        end

    # Removes carts abandoned for more than 7 days
    Cart.where.not(abandoned_at: nil)
        .where("abandoned_at < ?", 7.days.ago)
        .find_each do |cart|
          cart.remove_if_abandoned
        end
  end
end
