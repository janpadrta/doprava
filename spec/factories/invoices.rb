# == Schema Information
#
# Table name: invoices
#
#  id                     :bigint           not null, primary key
#  date_of_issue          :date
#  date_of_taxable_supply :date
#  due_date               :date
#  paid_on                :date
#  payment_type           :text
#  reference_number       :text
#  tax_base               :decimal(10, 3)
#  to_be_paid             :decimal(10, 3)
#  vat                    :decimal(10, 3)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  customer_id            :integer
#  order_id               :bigint           not null
#  user_id                :bigint           not null
#
# Indexes
#
#  index_invoices_on_order_id  (order_id)
#  index_invoices_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (order_id => orders.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :invoice do
    reference_number { "MyText" }
    # order { order }
    payment_type { "MyText" }
    date_of_issue { "2020-10-19" }
    due_date { "2020-10-19" }
    date_of_taxable_supply { "2020-10-19" }
    tax_base { "9.99" }
    vat { "9.99" }
    to_be_paid { "9.99" }
    user { user }
  end
end
