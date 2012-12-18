class Animal < ActiveRecord::Base
  belongs_to :sale
  attr_accessible :allflex, :comments, :date, :metal1, :sale_id

  validates :metal1, :format => { :with => /\A\d{2}[a-zA-Z]{3}\d{4}\z/,
    :message => "Format must match: 12ABC1234" }
end
