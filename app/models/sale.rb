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

class Sale < ActiveRecord::Base
  attr_accessible :buyer_number, :person_id, :sale_date
  validates :person_id, :presence => true
  validates :buyer_number, :presence => true
  validates :sale_date, :date => { :message => 'must be a date.' }

  has_many   :animals
  has_one    :cvi
  belongs_to :person
end
