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
require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'shows address' do
    customer = FactoryBot.create(:customer)
    assert_equal("Street 11, 12345 City", customer.address)
  end
end
