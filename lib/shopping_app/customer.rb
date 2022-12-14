require_relative "user"
require_relative "cart"

class Customer < User
  attr_reader :cart

  def initialize(name)
    super(name) # Si vous souhaitez vérifier le rôle de super, veuillez vous référer au texte de [https://diver.diveintocode.jp/curriculums/2360].
    @cart = Cart.new(self) # Lorsqu'une instance Customer est créée, elle aura un panier qui lui appartient.
  end

end
