# == Schema Information
#
# Table name: customers
#
#  id           :bigint           not null, primary key
#  bank_account :string
#  city         :string
#  dic          :string
#  email        :string
#  ic           :integer
#  kind         :integer
#  name         :string           not null
#  number       :string
#  phone        :string
#  psc          :string
#  street       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Customer < ApplicationRecord
  has_many :orders
  has_many :invoices

  scope :dopajo, -> { where(kind: 0) }
  scope :zadavatele, -> { where(kind: 1) }
  scope :firma, -> { where(kind: 2) }

  after_initialize :default_values

  def address
    "#{street} #{number}, #{psc} #{city}"
  end

  private

  def default_values
    self.kind ||= 2
  end

end
