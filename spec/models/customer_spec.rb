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
  pending "add some examples to (or delete) #{__FILE__}"
end
