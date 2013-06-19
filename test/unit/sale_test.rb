# == Schema Information
#
# Table name: sales
#
#  id           :integer          not null, primary key
#  buyer_number :integer
#  sale_date    :date
#  person_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
