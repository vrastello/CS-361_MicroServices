class ChangeStoreColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :stores, :rating, :float
  end
end
