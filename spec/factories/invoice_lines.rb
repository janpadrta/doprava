# == Schema Information
#
# Table name: invoice_lines
#
#  id             :bigint           not null, primary key
#  label          :string
#  price          :decimal(10, 3)
#  price_with_vat :decimal(10, 3)
#  vat            :decimal(10, 3)
#  vat_percent    :decimal(10, 3)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  invoice_id     :bigint           not null
#
# Indexes
#
#  index_invoice_lines_on_invoice_id  (invoice_id)
#
# Foreign Keys
#
#  fk_rails_...  (invoice_id => invoices.id)
#
FactoryBot.define do
  factory :invoice_line do
    invoice { nil }
    label { "MyString" }
    price { "9.99" }
    vat_percent { "9.99" }
    vat { "9.99" }
    price_with_vat { "9.99" }
  end
end
