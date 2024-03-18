class CreateConnections < ActiveRecord::Migration[7.1]
  def change
    create_table :connections do |t|
      t.references :user_1, null: false, foreign_key: { to_table: 'users' }
      t.references :user_2, null: false, foreign_key: { to_table: 'users' }
      t.string :connection_status

      t.timestamps
    end
  end
end
