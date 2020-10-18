class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.text :reference_number
      t.belongs_to :order, null: false, foreign_key: true
      t.text :payment_type
      t.date :date_of_issue
      t.date :due_date
      t.date :date_of_taxable_supply
      t.decimal :tax_base, precision: 10, scale: 3
      t.decimal :vat, precision: 10, scale: 3
      t.decimal :to_be_paid, precision: 10, scale: 3
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
