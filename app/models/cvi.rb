class Cvi < ActiveRecord::Base
  attr_accessible :cvi_number, :date, :person_id
  belongs_to :person 
  belongs_to :sale
  has_many :animals, :through => :sale
end
