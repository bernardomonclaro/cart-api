# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# # Limpa dados anteriores
# CartItem.delete_all
# Cart.delete_all
# Product.delete_all

# # Cria produtos
# products = Product.create!([
#   # Smartphones
#   { name: 'Samsung Galaxy S24 Ultra', price: 12999.99 },
#   { name: 'iPhone 15 Pro Max', price: 14999.99 },
#   { name: 'Xiamo Mi 27 Pro Plus Master Ultra', price: 999.99 },
#   { name: 'Motorola Edge 40 Neo', price: 1899.99 },
#   { name: 'Realme GT Neo 3', price: 2199.99 },
#   { name: 'Google Pixel 8 Pro', price: 8999.99 },
#   { name: 'Asus ROG Phone 7', price: 6499.99 },

#   # Laptops
#   { name: 'MacBook Pro M3 Max', price: 21999.99 },
#   { name: 'Dell XPS 15', price: 12999.99 },
#   { name: 'Lenovo Legion 5i', price: 8499.99 },
#   { name: 'Acer Nitro 5', price: 5299.99 },
#   { name: 'HP Envy x360', price: 6799.99 },

#   # Fones de ouvido
#   { name: 'Apple AirPods Pro 2', price: 1799.99 },
#   { name: 'Sony WH-1000XM5', price: 2399.99 },
#   { name: 'JBL Tune 760NC', price: 699.99 },
#   { name: 'Samsung Galaxy Buds2 Pro', price: 999.99 },

#   # Smartwatches
#   { name: 'Apple Watch Ultra 2', price: 5599.99 },
#   { name: 'Samsung Galaxy Watch 6', price: 1599.99 },
#   { name: 'Amazfit GTR 4', price: 899.99 },
#   { name: 'Huawei Watch GT 3', price: 1299.99 },

#   # Periféricos
#   { name: 'Logitech MX Master 3S', price: 599.99 },
#   { name: 'Razer Huntsman Mini', price: 799.99 },
#   { name: 'HyperX Cloud II', price: 499.99 },
#   { name: 'Corsair K70 RGB', price: 899.99 },
#   { name: 'Monitor LG UltraGear 27"', price: 1899.99 },

#   # Eletrodomésticos
#   { name: 'Air Fryer Mondial 5L', price: 429.99 },
#   { name: 'Cafeteira Nespresso Vertuo', price: 799.99 },
#   { name: 'Geladeira Brastemp Inverse 443L', price: 4299.99 },
#   { name: 'Micro-ondas Electrolux 20L', price: 499.99 },
#   { name: 'Aspirador de Pó Robo Xiaomi', price: 1499.99 },

#   # Livros
#   { name: 'Clean Code - Robert C. Martin', price: 129.99 },
#   { name: 'O Programador Pragmático', price: 109.99 },
#   { name: 'Sapiens - Yuval Harari', price: 69.99 },
#   { name: '1984 - George Orwell', price: 39.99 },
#   { name: 'A Revolução dos Bichos', price: 29.99 },

#   # Brinquedos
#   { name: 'LEGO Star Wars X-Wing', price: 799.99 },
#   { name: 'Boneco Homem-Aranha Marvel Legends', price: 119.99 },
#   { name: 'Jogo de Tabuleiro Catan', price: 199.99 },
#   { name: 'Hot Wheels Mega Pista Looping', price: 229.99 },
#   { name: 'Quebra-cabeça 2000 peças', price: 89.99 },

#   # Outros
#   { name: 'Kindle Paperwhite 11ª Geração', price: 699.99 },
#   { name: 'Google Chromecast com Google TV', price: 399.99 },
#   { name: 'Fire TV Stick 4K Max', price: 349.99 },
#   { name: 'Smart Lamp Xiaomi', price: 149.99 },
#   { name: 'Controle Xbox Series', price: 459.99 },
#   { name: 'Caixa de som JBL Flip 6', price: 599.99 },
#   { name: 'Echo Dot 5ª geração', price: 349.99 }
# ])


# puts "Criados #{products.count} produtos"
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

# Carrinho ativo (atualizado agora)
active_cart = Cart.create!(last_interaction_at: Time.current, updated_at: Time.current)
active_cart.cart_items.create!(
  product: products[0],
  quantity: 1,
  unit_price: products[0].price
)

active_cart.total_price = products[0].price
active_cart.save!
# Carrinho abandonado há 4h (sem interação há mais de 3h, será marcado como abandonado)
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

# Carrinho abandonado há mais de 7 dias (será destruído pelo job)
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