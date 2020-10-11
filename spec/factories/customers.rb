# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  address    :string
#  dic        :string
#  email      :string
#  ic         :integer
#  name       :string           not null
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :customer do
    name { "MyString" }
    address { "MyString" }
    phone { "MyString" }
    email { "MyString" }
    ic { 1 }
    dic { "MyString" }
  end
end
