class ChangeDefaultValueForApproved < ActiveRecord::Migration[5.2]
  def change
    change_column_default :bookings, :approved, nil
  end
end
