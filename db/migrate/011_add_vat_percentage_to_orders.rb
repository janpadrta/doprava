class AddVatPercentageToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :vat_percentage, :decimal, precision: 10, scale: 3
  end
end
