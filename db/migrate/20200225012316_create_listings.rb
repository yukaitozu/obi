class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :category
      t.string :size
      t.integer :average_rating
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
