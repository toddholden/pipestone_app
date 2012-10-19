class Person < ActiveRecord::Base
  attr_accessible :address, :city, :firstname, :lastname, :state

  has_many :sales
end
