class AddFinishedToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :finished, :boolean
  end
end
