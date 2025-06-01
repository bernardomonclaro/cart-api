# spec/factories/products.rb
FactoryBot.define do
  factory :product do
    name { "Example Product" }
    price { 100.0 }
  end
end
