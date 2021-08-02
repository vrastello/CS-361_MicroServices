# email:string
# password_digest:string
# password:string virtual
# password_confirmation:string virtual
class User < ApplicationRecord
  has_secure_password

  has_many :shopping_lists
  has_many :saved_items

  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }
end
