require 'rails_helper'

RSpec.describe MarkCartAsAbandonedJob, type: :job do
  describe "#perform" do
    let!(:active_cart) { Cart.create!(last_interaction_at: 1.hour.ago) }
    let!(:inactive_cart) { Cart.create!(last_interaction_at: 4.hours.ago) }
    let!(:abandoned_cart) { Cart.create!(last_interaction_at: 10.days.ago, abandoned_at: 8.days.ago) }

    it "marks carts that have been inactive for more than 3 hours as abandoned" do
      expect(inactive_cart.abandoned_at).to be_nil

      described_class.new.perform

      expect(inactive_cart.reload.abandoned_at).not_to be_nil
    end

    it "does not mark still active carts as abandoned" do
      described_class.new.perform

      expect(active_cart.reload.abandoned_at).to be_nil
    end

    it "removes carts abandoned for more than 7 days" do
      expect { described_class.new.perform }.to change { Cart.exists?(abandoned_cart.id) }.from(true).to(false)
    end
  end
end
