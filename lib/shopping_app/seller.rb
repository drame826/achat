require_relative "user"

class Seller < User
  def initialize(name)
    super(name)# Si vous souhaitez vérifier le rôle de super, veuillez vous référer au texte de [https://diver.diveintocode.jp/curriculus/2360].
  end

end
