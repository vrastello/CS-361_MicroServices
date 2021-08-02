class ShoppingList < ApplicationRecord
  belongs_to :user
  has_many :items

  def items_in_list
    Item.where(list_id: id).all
  end
end
