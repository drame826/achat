require_relative "shopping_app/seller"
require_relative "shopping_app/item"
require_relative "shopping_app/customer"

seller = Seller.new("DIC Store")
10.times{ Item.new("CPU", 40830, seller) }
10.times{ Item.new("MÃ©moire", 13880, seller) }
10.times{ Item.new("Carte-mÃ¨re", 28980, seller) }
10.times{ Item.new("Bloc d'alimentation", 8980, seller) }
10.times{ Item.new("BoÃ®tier PC", 8727, seller) }
10.times{ Item.new("Disque dur 3,5 pouces", 10980, seller) }
10.times{ Item.new("SSD 2,5 pouces", 13370, seller) }
10.times{ Item.new("M.2 SSD", 12980, seller) }
10.times{ Item.new("Refroidisseur de processeur", 13400, seller) }
10.times{ Item.new("carte graphique", 23800, seller) }

puts "ð¤ Quel est votre nom ?"
customer = Customer.new(gets.chomp)

puts "ð§ Veuillez entrer le montant pour charger le portefeuille"
customer.wallet.deposit(gets.chomp.to_i)

puts "ðï¸ commencer les achats"
end_shopping = false
while !end_shopping do
  puts "ð Liste de produits"
  seller.items_list

  puts "ï¸ï¸â Veuillez entrer le numÃ©ro de produit"
  number = gets.to_i

  puts "â Veuillez entrer la quantitÃ© de produit"
  quantity = gets.to_i

  items = seller.pick_items(number, quantity)

  items&.each{|item| customer.cart.add(item) }

  puts "ð Contenu du panier"
  customer.cart.items_list
  puts "ð¤ Montant total: #{customer.cart.total_amount}"

  puts "ð­ Finir vos achats ?(yes/no)"
  end_shopping = gets.chomp == "yes"
end

puts "ð¸ Confirmer l'achat?(yes/no)"
customer.cart.check_out if gets.chomp == "yes"

puts "à­¨à­§âââââââââââââââââ RÃ©sultatâââââââââââââââââà­¨à­§"
puts "ï¸ðï¸ ï¸#{customer.name}propriÃ©tÃ© de"
customer.items_list
puts "ð±ð #{customer.name}solde du portefeuille de: #{customer.wallet.balance}"

puts "ð¦ #{seller.name}Ã©tat des stocks de"
seller.items_list
puts "ð»ð #{seller.name}solde du portefeuille de: #{seller.wallet.balance}"

puts "ð Contenu du panier"
customer.cart.items_list
puts "ð Montant total: #{customer.cart.total_amount}"

puts "ð Fin"
