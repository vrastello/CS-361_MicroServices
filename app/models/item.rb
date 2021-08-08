class Item < ApplicationRecord
  has_one :shopping_list

  def in_cart?
    is_found
  end
end
