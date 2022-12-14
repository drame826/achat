require_relative "ownable"

class Item
  include Ownable
  attr_reader :name, :price

  @@instances = []

  def initialize(name, price, owner=nil)
    @name = name
    @price = price
    self.owner = owner

    # Lors de la création d'une instance d'élément, cette instance d'élément (self) est stockée dans une variable de classe appelée @@instances.
    @@instances << self
  end

  def label
    { name: name, price: price }
  end

  def self.all
    # Renvoie @@instances ==> Renvoie toutes les instances d'Item générées jusqu'à présent avec Item.all.
    @@instances
  end

end