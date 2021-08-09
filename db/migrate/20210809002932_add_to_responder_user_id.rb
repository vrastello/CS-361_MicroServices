class AddToResponderUserId < ActiveRecord::Migration[6.1]
  def change
    add_column :api_responders, :user_id, :integer
  end
end
