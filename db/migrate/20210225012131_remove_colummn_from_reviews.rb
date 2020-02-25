class RemoveColummnFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :bookings_id, :integer
  end
end
