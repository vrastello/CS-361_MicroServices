class ChangeIdForStore < ActiveRecord::Migration[6.1]
  def change
    rename_column :stores, :responder_id, :api_responder_id
  end
end
