class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :location
      t.string :title
      t.float :price
    end
  end
end
