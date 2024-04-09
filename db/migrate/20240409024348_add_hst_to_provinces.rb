class AddHstToProvinces < ActiveRecord::Migration[7.1]
  def change
    add_column :provinces, :hst, :float
  end
end
