class Sale < ActiveRecord::Base
  attr_accessible :buyer_number, :person_id, :sale_date

  has_many   :animals
  belongs_to :person
end
