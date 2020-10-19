# == Schema Information
#
# Table name: customers
#
#  id         :bigint           not null, primary key
#  address    :string
#  dic        :string
#  email      :string
#  ic         :integer
#  kind       :integer
#  name       :string           not null
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Customer < ApplicationRecord
  has_many :orders

  scope :dopajo, -> { where(kind: 0) }
  scope :zadavatele, -> { where(kind: 1) }
  scope :firma, -> { where(kind: 2) }

  after_initialize :default_values

  private

  def default_values
    self.kind ||= 2
  end

end
