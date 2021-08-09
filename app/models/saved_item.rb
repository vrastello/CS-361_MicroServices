class SavedItem < ApplicationRecord
  has_one :user
  has_many :items

  def self.names_of_items
    item_ids = Current.user.saved_items.ids
    name_array = []
    item_ids.each do |item_id|
      name_array.append(SavedItem.find(item_id).name)
    end
    name_array
  end
end
