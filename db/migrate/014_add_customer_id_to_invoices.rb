class AddCustomerIdToInvoices < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :customer_id, :integer
  end
end
