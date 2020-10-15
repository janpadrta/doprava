# == Schema Information
#
# Table name: orders
#
#  id               :bigint           not null, primary key
#  currency         :text
#  datum            :date
#  distance         :decimal(10, 2)
#  fix_price        :boolean
#  label            :text
#  load_capacity    :decimal(10, 3)
#  load_description :string
#  load_type        :string
#  load_volume      :decimal(10, 3)
#  price            :decimal(10, 3)
#  price_per_km     :decimal(10, 3)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  customer_id      :integer          not null
#  destination_id   :integer
#  origin_id        :integer
#  user_id          :integer          not null
#
# Indexes
#
#  index_orders_on_customer_id  (customer_id)
#  index_orders_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
