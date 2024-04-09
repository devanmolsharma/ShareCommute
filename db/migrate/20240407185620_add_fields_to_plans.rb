class AddFieldsToPlans < ActiveRecord::Migration[7.1]
  def change
    add_column :plans, :taxes, :float
    add_column :plans, :total, :float
  end
end
