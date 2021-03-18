# == Schema Information
#
# Table name: customers
#
#  id           :bigint           not null, primary key
#  bank         :string
#  bank_account :string
#  city         :string
#  dic          :text
#  email        :text
#  iban         :string
#  ic           :integer
#  kind         :integer
#  name         :text             not null
#  number       :string
#  phone        :text
#  psc          :string
#  street       :string
#  swift        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Customer < ApplicationRecord
  has_many :orders
  has_many :invoices

  scope :jhtrans, -> { where(kind: 0) }
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
