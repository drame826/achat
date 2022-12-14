require_relative "item_manager"
require_relative "wallet"

class User
  include ItemManager

  attr_accessor :name
  attr_reader :wallet

  def initialize(name)
    @name = name
    @wallet = Wallet.new(self) # Lorsqu'une instance User ou une instance d'une classe qui hérite de User est créée, elle possède un portefeuille qui lui appartient.
  end

end
