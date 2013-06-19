# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  lastname   :string(255)
#  firstname  :string(255)
#  address    :string(255)
#  city       :string(255)
#  state      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  zipcode    :string(255)
#

require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
