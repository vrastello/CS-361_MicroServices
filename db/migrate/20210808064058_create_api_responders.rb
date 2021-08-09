class CreateAPIResponders < ActiveRecord::Migration[6.1]
  def change
    create_table :api_responders do |t|
      t.string :zip_code

      t.timestamps
    end
  end
end
