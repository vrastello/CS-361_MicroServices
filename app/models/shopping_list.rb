class ShoppingList < ApplicationRecord
  belongs_to :user
  has_many :items

  @@active = ''

  def items_in_list
    Item.where(list_id: id).all
  end

  def self.active
    @@active
  end

  def self.set_active(x)
    @@active = x
  end

  def active?
    self[:id] == @@active
  end
end
