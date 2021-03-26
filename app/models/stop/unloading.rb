# == Schema Information
#
# Table name: stops
#
#  id         :bigint           not null, primary key
#  city       :string
#  country    :string
#  label      :string           not null
#  number     :string
#  sequence   :integer
#  street     :string
#  type       :string
#  way_back   :boolean          default(FALSE)
#  zip_code   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :bigint           not null
#
# Indexes
#
#  index_stops_on_order_id  (order_id)
#
# Foreign Keys
#
#  fk_rails_...  (order_id => orders.id)
#
class Stop::Unloading < Stop
end
