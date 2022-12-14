require_relative "shopping_app/seller"
require_relative "shopping_app/item"
require_relative "shopping_app/customer"

seller = Seller.new("DIC Store")
10.times{ Item.new("CPU", 40830, seller) }
10.times{ Item.new("Mémoire", 13880, seller) }
10.times{ Item.new("Carte-mère", 28980, seller) }
10.times{ Item.new("Bloc d'alimentation", 8980, seller) }
10.times{ Item.new("Boîtier PC", 8727, seller) }
10.times{ Item.new("Disque dur 3,5 pouces", 10980, seller) }
10.times{ Item.new("SSD 2,5 pouces", 13370, seller) }
10.times{ Item.new("M.2 SSD", 12980, seller) }
10.times{ Item.new("Refroidisseur de processeur", 13400, seller) }
10.times{ Item.new("carte graphique", 23800, seller) }

puts "🤖 Quel est votre nom ?"
customer = Customer.new(gets.chomp)

puts "🏧 Veuillez entrer le montant pour charger le portefeuille"
customer.wallet.deposit(gets.chomp.to_i)

puts "🛍️ commencer les achats"
end_shopping = false
while !end_shopping do
  puts "📜 Liste de produits"
  seller.items_list

  puts "️️⛏ Veuillez entrer le numéro de produit"
  number = gets.to_i

  puts "⛏ Veuillez entrer la quantité de produit"
  quantity = gets.to_i

  items = seller.pick_items(number, quantity)

  items&.each{|item| customer.cart.add(item) }

  puts "🛒 Contenu du panier"
  customer.cart.items_list
  puts "🤑 Montant total: #{customer.cart.total_amount}"

  puts "😭 Finir vos achats ?(yes/no)"
  end_shopping = gets.chomp == "yes"
end

puts "💸 Confirmer l'achat?(yes/no)"
customer.cart.check_out if gets.chomp == "yes"

puts "୨୧┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ Résultat┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈୨୧"
puts "️🛍️ ️#{customer.name}propriété de"
customer.items_list
puts "😱👛 #{customer.name}solde du portefeuille de: #{customer.wallet.balance}"

puts "📦 #{seller.name}état des stocks de"
seller.items_list
puts "😻👛 #{seller.name}solde du portefeuille de: #{seller.wallet.balance}"

puts "🛒 Contenu du panier"
customer.cart.items_list
puts "🌚 Montant total: #{customer.cart.total_amount}"

puts "🎉 Fin"
