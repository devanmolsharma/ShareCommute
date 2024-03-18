class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :phone
      t.string :email
      t.string :password_digest
      t.boolean :verified
      t.string :address
      t.boolean :public

      t.timestamps
    end
  end
end
