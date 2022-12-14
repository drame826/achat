# Si vous souhaitez vérifier le rôle du module, veuillez vous référer au texte de [https://diver.diveintocode.jp/curriculus/2360].
require "kosi"
require_relative "item"

# L'inclusion de ce module vous permettra de manipuler vos propres instances Item.
module ItemManager
  def items # Renvoie toutes les instances d'élément détenues par soi (propriété personnelle).
    Item.all.select{|item| item.owner == self }
  end

  def pick_items(number, quantity) # Renvoie la quantité spécifiée d'instances d'élément appartenant à lui-même correspondant au nombre.
    items = stock.find{|stock| stock[:number] == number }&.dig(:items)
    return if items.nil? || items.size < quantity
    items.slice(0, quantity)
  end

  def items_list # Afficher l'état de l'inventaire des instances d'article détenues par lui-même dans un format de tableau avec des colonnes ["nombre", "nom du produit", "prix", "quantité"].
    kosi = Kosi::Table.new({header: %w{番号 商品名 金額 数量}}) # écrire l'URL "kosi" en Gemgile
    print kosi.render(
      stock.map do |stock|
        [
          stock[:number],
          stock[:label][:name],
          stock[:label][:price],
          stock[:items].size
        ]
      end
    )
  end

  private

  def stock # Renvoie l'état de l'inventaire des instances d'élément appartenant à lui-même.
    items
      .group_by{|item| item.label } # Classer par les instances Item qui renvoient la même valeur avec Item#label.
      .map.with_index do |label_and_items, index|
        {
          number: index,
          label: {
            name: label_and_items[0][:name],
            price: label_and_items[0][:price],
          },
          items: label_and_items[1], # Stockez les instances d'éléments catégorisés dans ces éléments.
        }
      end
  end

end
