class AddBookingsToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :bookings, foreign_key: true
  end
end
