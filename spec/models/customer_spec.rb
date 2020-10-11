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
require 'rails_helper'

RSpec.describe Customer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
