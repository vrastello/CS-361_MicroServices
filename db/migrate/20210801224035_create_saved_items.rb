class CreateSavedItems < ActiveRecord::Migration[6.1]
  def change
    create_table :saved_items do |t|
      t.integer :user_id
      t.string :name

      t.timestamps
    end
  end
end
