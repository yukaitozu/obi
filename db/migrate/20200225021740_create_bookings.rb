class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :return_date
      t.boolean :approved
      t.references :user, foreign_key: true
      t.references :listing, foreign_key: true

      t.timestamps
    end
  end
end
