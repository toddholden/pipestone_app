# == Schema Information
#
# Table name: cvis
#
#  id         :integer          not null, primary key
#  cvi_number :string(255)
#  date       :date
#  person_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  sale_id    :integer
#

class Cvi < ActiveRecord::Base
  attr_accessible :cvi_number, :date, :person_id, :sale_id, :date_string

  belongs_to :person 
  belongs_to :sale

  has_many :animals, :through => :sale

  validates :person_id, :presence => true
  validates :cvi_number, :presence => true, 
            :uniqueness => { :message => "That CVI number has already been used." },
            :numericality => { :only_integer => true }
  validates :date, :date => { :message => 'must be a date with the format mm/dd/yyyy.' }

  def date_string
    date
  end

  def date_string=(date_str)
    self.date = Date.strptime(date_str, "%m/%d/%Y")
  end

  def newCviNumber
    cviBase = 0
    c = Cvi.last
      if c
        cvi_number = c.cvi_number.to_i + 1
      else
        cvi_number = cviBase
      end  
    return cvi_number
  end 
end
