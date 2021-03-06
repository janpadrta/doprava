# == Schema Information
#
# Table name: cars
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE)
#  name       :string           not null
#  spz        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Car < ApplicationRecord
  has_many :orders

  scope :inactive, -> { where(active: false) }
  scope :active, -> { where(active: true) }
end
