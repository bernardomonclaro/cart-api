class CleanupAbandonedCartsJob < ApplicationJob
  queue_as :default

  def perform
    Cart.where("last_interaction_at < ? AND abandoned = ?", 3.hours.ago, false).update_all(abandoned: true)
    Cart.where("abandoned = ? AND updated_at < ?", true, 7.days.ago).destroy_all
  end
end

# config/schedule.rb (se usar sempre)
every 1.hour do
  runner "CleanupAbandonedCartsJob.perform_later"
end