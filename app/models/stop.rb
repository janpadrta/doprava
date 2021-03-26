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
class Stop < ApplicationRecord
  belongs_to :order

  before_create :set_sequence

  def text
    "#{label}, #{street} #{number}, #{zip_code} #{city}, #{country}"
  end

  def self.inherited(child)
    child.instance_eval do
      def model_name
        Stop.model_name
      end
    end
    super
  end

  private

  def set_sequence
    last = self.order.stops.order(:sequence).last
    seq = last.present? ? last.sequence + 1 : 1
    self.sequence = seq
  end
end
