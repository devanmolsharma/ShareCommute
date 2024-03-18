class CreateRides < ActiveRecord::Migration[7.1]
  def change
    create_table :rides do |t|
      t.string :from
      t.string :to
      t.integer :seats
      t.integer :price_share
      t.references :user, null: false, foreign_key: true
      t.datetime :time
      t.boolean :active

      t.timestamps
    end
  end
end
