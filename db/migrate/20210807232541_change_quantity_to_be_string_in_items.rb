class ChangeQuantityToBeStringInItems < ActiveRecord::Migration[6.1]
  def up
    change_column :items, :quantity, :string
  end

  def down
    change_column :items, :quantity, :integer
  end
end
