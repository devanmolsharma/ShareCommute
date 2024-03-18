class AddCategoryToRides < ActiveRecord::Migration[7.1]
  def change
    add_reference :rides, :category, null: false, foreign_key: true
  end
end
