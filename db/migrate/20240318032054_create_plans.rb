class CreatePlans < ActiveRecord::Migration[7.1]
  def change
    create_table :plans do |t|
      t.references :trip, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
