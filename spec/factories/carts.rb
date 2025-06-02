FactoryBot.define do
  factory :cart, class: 'Cart' do
    total_price { 0.0 }
    last_interaction_at { Time.current }

    trait :empty do
      # nenhum cart_item
    end

    trait :with_products do
      after(:create) do |cart|
        create_list(:cart_item, 2, cart: cart)
      end
    end

    trait :abandoned do
      abandoned_at { 8.days.ago }
    end
  end
end

