require_relative "item_manager"
require_relative "ownable"

class Cart
  include ItemManager
  include Ownable

  def initialize(owner)
    self.owner = owner
    @items = []
  end

  def items
    # Remplacez la méthode des éléments d'ItemManager car nous voulons que les éléments du panier soient ses propres @éléments.
    # En effet, lorsqu'une instance Cart a une instance Item, elle la stocke simplement dans ses propres @items (Cart#add) sans en transférer la propriété.
    @items
  end

  def add(item)
    @items << item
  end

  def total_amount
    @items.sum(&:price)
  end

  def check_out
    return if owner.wallet.balance < total_amount
    self.owner.wallet.withdraw(total_amount)
      seller = items[0].owner
      seller.wallet.deposit(total_amount)

      customer = self.owner
      items.map do |item|
        item.owner = customer
      end

      items.clear
 # ## Conditions
  # - Le montant de l'achat de tous les articles du panier (Cart#items) est transféré du portefeuille du propriétaire du panier au portefeuille du propriétaire de l'article.
  # - La propriété de tous les articles du panier (Cart#items) est transférée au propriétaire du panier.
  # - Le contenu du panier (Cart#items) est vide.

  # ## Des astuces
  # - portefeuille du propriétaire du panier ==> self.owner.wallet
  # - Portefeuille du propriétaire de l'objet ==> item.owner.wallet
  # - L'argent est transféré ==> Retirez ce montant du portefeuille (?) et déposez ce montant dans le portefeuille (?)
  # - la propriété de l'article est transférée au propriétaire du panier ==> réécrire le propriétaire (item.owner = ?)
  end

end
