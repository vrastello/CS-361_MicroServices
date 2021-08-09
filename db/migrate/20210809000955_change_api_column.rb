class ChangeAPIColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :stores, :api_key, :responder_id
  end
end
