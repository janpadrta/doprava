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
FactoryBot.define do
  factory :car do
    name { "MyString" }
    spz { "MyString" }
    active { false }
  end
end
