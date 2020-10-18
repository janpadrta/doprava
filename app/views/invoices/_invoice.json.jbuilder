json.extract! invoice, :id, :reference_number, :order_id, :payment_type, :date_of_issue, :due_date, :date_of_taxable_supply, :tax_base, :vat, :to_be_paid, :user_id, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
