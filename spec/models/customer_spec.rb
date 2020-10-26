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
require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'shows address' do
    customer = FactoryBot.create(:customer)
    assert_equal("Street 11, 12345 City", customer.address)
  end
end
