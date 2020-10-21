class AddFieldsToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :bank_account, :string

    remove_column :customers, :address
    add_column :customers, :street, :string
    add_column :customers, :number, :string
    add_column :customers, :psc, :string
    add_column :customers, :city, :string
  end
end
