class FixColumn < ActiveRecord::Migration[6.1]
  def change
    change_table :stores do |t|
      t.rename :open, :open_now
      t.rename :address, :vicinity
      t.rename :ratings_total, :user_ratings_total
    end
  end
end
