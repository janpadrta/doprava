# == Schema Information
#
# Table name: customers
#
#  id           :bigint           not null, primary key
#  bank_account :string
#  city         :string
#  dic          :text
#  email        :text
#  ic           :integer
#  kind         :integer
#  name         :text             not null
#  number       :string
#  phone        :text
#  psc          :string
#  street       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :customer do
    name { "Customer" }
    street { "Street" }
    number { "11" }
    psc { "12345" }
    city { "City" }
    phone { "123456789" }
    email { "MyString" }
    ic { 123456 }
    dic { "CZ123456" }
  end
end
