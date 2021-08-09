class AddAPIId < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :api_key, :integer
  end
end
