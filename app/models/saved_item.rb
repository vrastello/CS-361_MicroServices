class SavedItem < ApplicationRecord
  belongs_to :users
  has_many :items
end
