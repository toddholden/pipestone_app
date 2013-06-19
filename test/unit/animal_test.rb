# == Schema Information
#
# Table name: animals
#
#  id              :integer          not null, primary key
#  date            :date
#  metal1          :string(255)
#  allflex         :string(255)
#  comments        :text
#  sale_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  sold            :boolean          default(FALSE)
#  temperature     :string(255)
#  old_tag         :string(255)
#  months_pregnant :string(255)
#  bruc            :string(255)
#  chv             :string(255)
#  breed           :string(255)
#  sex             :string(255)
#  age             :string(255)
#  person_id       :integer
#

require 'test_helper'

class AnimalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
