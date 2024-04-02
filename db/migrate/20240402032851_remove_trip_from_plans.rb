class RemoveTripFromPlans < ActiveRecord::Migration[7.1]
  def change
    remove_reference :plans, :trip, null: false, foreign_key: true
  end
end
