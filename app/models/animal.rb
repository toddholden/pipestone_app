class Animal < ActiveRecord::Base
  belongs_to :sale
  attr_accessible :allflex, :comments, :date, :metal1
end
