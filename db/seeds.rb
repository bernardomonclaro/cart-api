# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# clears previous data
# CartItem.delete_all
# Cart.delete_all
# Product.delete_all

# create sample products
products = Product.create!([
  { name: 'Nokia XR21', price: 2799.99 },
  { name: 'Sony Xperia 1 V', price: 7999.99 },
  { name: 'OnePlus 11R', price: 3499.99 },
  { name: 'Lenovo Legion Y90', price: 5999.99 },
  { name: 'Black Shark 5 Pro', price: 4599.99 },
  { name: 'ZTE Nubia RedMagic 8', price: 5199.99 },
  { name: 'Honor Magic 5 Pro', price: 7599.99 },
  { name: 'Vivo X90 Pro Plus', price: 8399.99 },
  { name: 'Meizu 20 Infinity', price: 3999.99 },
  { name: 'HTC U23 Pro', price: 3299.99 },
  { name: 'Oppo Find X6 Pro', price: 7899.99 },
  { name: 'Tecno Phantom X2 Pro', price: 2499.99 },
  { name: 'Infinix Zero Ultra', price: 1999.99 },
  { name: 'Realme Narzo 60X', price: 1399.99 },
  { name: 'POCO F5 Pro', price: 2399.99 },
  { name: 'iQOO 11 Legend Edition', price: 5599.99 },
  { name: 'Fairphone 5', price: 3599.99 },
  { name: 'Redmi Note 12 Pro Plus', price: 1899.99 },
  { name: 'Samsung Galaxy A54', price: 2199.99 },
  { name: 'iPhone SE 2023', price: 3799.99 },
  { name: 'Motorola G73 5G', price: 1499.99 },
  { name: 'Asus Zenfone 10', price: 4899.99 },
  { name: 'Nothing Phone (2)', price: 3999.99 },
  { name: 'Xiaomi 13 Ultra', price: 9999.99 },
  { name: 'Honor X9A', price: 1699.99 },
  { name: 'Oppo Reno 10 Pro', price: 2999.99 },
  { name: 'Vivo V27e', price: 1699.99 },
  { name: 'ZTE Axon 50 Ultra', price: 6999.99 },
  { name: 'Realme C55', price: 1299.99 },
  { name: 'Samsung Galaxy M14', price: 1199.99 },
  { name: 'Infinix Note 30 Pro', price: 999.99 },
  { name: 'Nokia G60', price: 1199.99 },
  { name: 'Sony Xperia 10 V', price: 2999.99 },
  { name: 'Asus ROG Ally', price: 6499.99 },
  { name: 'RedMagic 7S Pro', price: 5499.99 },
  { name: 'Motorola Edge 50 Fusion', price: 2399.99 },
  { name: 'Realme GT5', price: 3999.99 },
  { name: 'Xiaomi Civi 3', price: 2899.99 },
  { name: 'Tecno Spark 10 Pro', price: 1099.99 },
  { name: 'POCO X5 5G', price: 1699.99 },
  { name: 'iQOO Z7 Pro', price: 2099.99 },
  { name: 'Vivo T2 5G', price: 1499.99 }
])

# active cart
active_cart = Cart.create!(last_interaction_at: Time.current, updated_at: Time.current)
active_cart.cart_items.create!(
  product: products[0],
  quantity: 1,
  unit_price: products[0].price
)

active_cart.total_price = products[0].price
active_cart.save!
# cart abandoned 4 hours ago (no interaction for more than 3 hours, will be marked as abandoned)
abandoned_cart = Cart.create!(
  last_interaction_at: 4.hours.ago,
  updated_at: 4.hours.ago
)
abandoned_cart.cart_items.create!(
  product: products[1],
  quantity: 2,
  unit_price: products[1].price
)

abandoned_cart.update_total_price!

# cart abandoned for more than 7 days (will be destroyed by the job)
old_cart = Cart.create!(
  last_interaction_at: 8.days.ago,
  updated_at: 8.days.ago,
  abandoned_at: 8.days.ago
)
old_cart.cart_items.create!(
  product: products[2],
  quantity: 1,
  unit_price: products[2].price
)

old_cart.update_total_price!

puts "Seed finalizado com 3 carrinhos:"
puts "- 1 ativo"
puts "- 1 para ser marcado como abandonado"
puts "- 1 que será destruído pelo job"