# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  lastname   :string(255)
#  firstname  :string(255)
#  address    :string(255)
#  city       :string(255)
#  state      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  zipcode    :string(255)
#

class Person < ActiveRecord::Base
  attr_accessible :address, :city, :firstname, :lastname, :state, :zipcode

  has_many :sales
  has_many :animals
  has_many :cvis, :through => :sale

  validates :firstname, :lastname, :address, :city, :state, :presence => true

  def self.search(search, page)
    paginate :per_page => 20, :page => page,
             :conditions => ['lastname LIKE ? OR firstname LIKE ?', "%#{search}%", "%#{search}%"],
             :order => 'lastname'
    #if search
    #  find(:all, :conditions => ['lastname LIKE ? OR firstname LIKE ?', "%#{search}%", "%#{search}%"])
    #else
    #  find(:all, :order => "lastname")
    #end
  end

  def name_by_last
    "#{self.lastname}, #{self.firstname}"
  end
end
