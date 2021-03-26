class AddRaalAndTimocomToCustomer < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :raal, :string
    add_column :customers, :timocom, :string
  end
end
