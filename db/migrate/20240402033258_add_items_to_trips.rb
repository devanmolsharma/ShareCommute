class AddItemsToTrips < ActiveRecord::Migration[7.1]
  def change
    add_reference :trips, :plan, null: false, foreign_key: true
  end
end
