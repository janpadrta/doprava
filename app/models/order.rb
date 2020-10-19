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
#  load_description :string
#  load_type        :string
#  load_volume      :decimal(10, 3)
#  price            :decimal(10, 3)
#  price_per_km     :decimal(10, 3)
#  vat_percentage   :decimal(10, 3)
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
class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :user
  belongs_to :origin, foreign_key: :origin_id, class_name: 'Customer'
  belongs_to :destination, foreign_key: :destination_id, class_name: 'Customer'
  has_many :invoices

  scope :finished, -> { where(finished: true) }
  scope :active, -> { where(finished: false) }

  after_initialize :default_values

  def full_price
    if fix_price?
      price
    else
      price_per_km * distance
    end
  end

  def vat_price
    full_price * (vat_percentage / 100.0)
  end

  def price_with_vat
    full_price + vat_price
  end

  private

  def default_values
    self.vat_percentage ||= 21.0
    self.finished ||= false
  end
end
