class Sale < ActiveRecord::Base
  attr_accessible :buyer_number, :person_id, :sale_date
  validates :person_id, :presence => true
  validates :buyer_number, :presence => true
  has_many   :animals
  belongs_to :person
end
