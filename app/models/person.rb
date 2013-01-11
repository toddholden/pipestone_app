class Person < ActiveRecord::Base
  attr_accessible :address, :city, :firstname, :lastname, :state, :zipcode

  has_many :sales
  has_many :animals

  validates :firstname, :lastname, :address, :city, :state, :presence => true

  def self.search(search)
    if search
      find(:all, :conditions => ['lastname LIKE ? OR firstname LIKE ?', "%#{search}%", "%#{search}%"])
    else
      find(:all, :order => "lastname")
    end
  end

  def name_by_last
    "#{self.lastname}, #{self.firstname}"
  end
end
