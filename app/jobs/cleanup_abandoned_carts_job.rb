class CleanupAbandonedCartsJob < ApplicationJob
  queue_as :default

  def perform
    # Marcar carrinhos como abandonados se inativos há mais de 3 horas e ainda não marcados
    Cart.where(abandoned_at: nil)
        .where("updated_at < ?", 3.hours.ago)
        .update_all(abandoned_at: Time.current)

    # Remover carrinhos que estão abandonados há mais de 7 dias
    Cart.where("abandoned_at < ?", 7.days.ago).destroy_all
  end
end
