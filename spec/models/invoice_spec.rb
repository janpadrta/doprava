# == Schema Information
#
# Table name: invoices
#
#  id                     :bigint           not null, primary key
#  date_of_issue          :date
#  date_of_taxable_supply :date
#  due_date               :date
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
require 'rails_helper'

RSpec.describe Invoice, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
