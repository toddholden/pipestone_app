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
  attr_accessible :buyer_number, :person_id, :sale_date, :date_string
  validates :person_id, :presence => true
  validates :buyer_number, :presence => true
  validates :sale_date, :date => { :message => 'must be a date with the format mm/dd/yyyy.' }

  has_many   :animals
  has_one    :cvi
  belongs_to :person

  def date_string
    sale_date
  end

  def date_string=(date_str)
    self.sale_date = Date.strptime(date_str, "%m/%d/%Y")
  end
end
