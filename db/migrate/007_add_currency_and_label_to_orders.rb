class AddCurrencyAndLabelToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :currency, :text
    add_column :orders, :label, :text
  end
end
