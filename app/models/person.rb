class Person < ActiveRecord::Base
  attr_accessible :address, :city, :firstname, :lastname, :state
  has_many :sales
  validates :firstname, :lastname, :address, :city, :state, :presence => true

  def self.search(search)
    if search
      find(:all, :conditions => ['lastname LIKE ? OR firstname LIKE ?', "%#{search}%", "%#{search}%"])
    else
      find(:all, :order => "lastname")
    end
  end
end
