class AddPaidOnToInvoices < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :paid_on, :date
  end
end
