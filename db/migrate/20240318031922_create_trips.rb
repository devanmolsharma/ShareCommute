class CreateTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :trips do |t|
      t.references :connection, null: false, foreign_key: true
      t.references :ride, null: false, foreign_key: true
      t.string :status
      t.float :cost

      t.timestamps
    end
  end
end
