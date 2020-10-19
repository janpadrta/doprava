class CreateInvoiceLines < ActiveRecord::Migration[6.0]
  def change
    create_table :invoice_lines do |t|
      t.belongs_to :invoice, null: false, foreign_key: true
      t.string :label
      t.decimal :price, precision: 10, scale: 3
      t.decimal :vat_percent, precision: 10, scale: 3
      t.decimal :vat, precision: 10, scale: 3
      t.decimal :price_with_vat, precision: 10, scale: 3

      t.timestamps
    end
  end
end
