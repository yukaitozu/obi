class AddTotalToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :total, :integer, default: 0
  end
end
