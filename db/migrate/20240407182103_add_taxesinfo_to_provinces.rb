class AddTaxesinfoToProvinces < ActiveRecord::Migration[7.1]
  def change
    add_column :provinces, :gst, :float
    add_column :provinces, :pst, :float
  end
end
