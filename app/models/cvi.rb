class Cvi < ActiveRecord::Base
  attr_accessible :cvi_number, :date, :person_id, :sale_id

  belongs_to :person 
  belongs_to :sale

  has_many :animals, :through => :sale

  validates :person_id, :presence => true

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
