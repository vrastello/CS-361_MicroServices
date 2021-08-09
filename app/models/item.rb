class Item < ApplicationRecord
  has_one :shopping_list

  def in_cart?
    is_found
  end

  def self.save_all_items
    list_array = ShoppingList.where(user_id: Current.user.id).ids
    list_array.each do |list_id|
      item_array = (Item.where(list_id: list_id)).ids
      item_array.each do |item_id|
        SavedItem.create({"user_id" => Current.user.id, "name" => Item.find(item_id).name})
      end
    end
  end
end
