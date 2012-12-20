class Person < ActiveRecord::Base
  attr_accessible :address, :city, :firstname, :lastname, :state
  has_many :sales

  def self.search(search)
    if search
      find(:all, :conditions => ['lastname LIKE ?', "%#{search}%"])
    else
      find(:all, :order => "lastname")
    end
  end
end
