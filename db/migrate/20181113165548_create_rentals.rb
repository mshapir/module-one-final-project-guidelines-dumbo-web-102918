class CreateRentals < ActiveRecord::Migration[5.0]
  def change
    create_table :rentals do |t|
      t.integer :listing_id
      t.integer :user_id
    end
  end
end
