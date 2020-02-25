class AddColorToListing < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :color, :string
  end
end
