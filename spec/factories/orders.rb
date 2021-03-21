# == Schema Information
#
# Table name: orders
#
#  id               :bigint           not null, primary key
#  currency         :text
#  datum            :date
#  distance         :decimal(10, 2)
#  finished         :boolean
#  fix_price        :boolean
#  label            :text
#  load_capacity    :decimal(10, 3)
#  load_description :text
#  load_type        :text
#  load_volume      :decimal(10, 3)
#  price            :decimal(10, 3)
#  price_per_km     :decimal(10, 3)
#  vat_percentage   :decimal(10, 3)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  car_id           :integer
#  customer_id      :bigint           not null
#  destination_id   :integer
#  origin_id        :integer
#  user_id          :bigint           not null
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
FactoryBot.define do
  factory :order do
    datum { "2020-10-15" }
    load_type { "MyString" }
    load_description { "MyString" }
    load_capacity { "9.99" }
    load_volume { "9.99" }
    origin_id { customer }
    destination_id { customer }
    distance { "9.99" }
    fix_price { false }
    price_per_km { "9.99" }
    price { "9.99" }
    customer { customer }
    user { user }
  end
end
