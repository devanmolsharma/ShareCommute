class AddSeatsToTrips < ActiveRecord::Migration[7.1]
  def change
    add_column :trips, :seats, :integer
  end
end
