class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.boolean :open
      t.integer :rating
      t.integer :ratings_total
      t.string :address

      t.timestamps
    end
  end
end
