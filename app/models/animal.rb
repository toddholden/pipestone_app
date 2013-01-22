class Animal < ActiveRecord::Base
  belongs_to :sale
  belongs_to :person

  def self.search(search, page)
    paginate :per_page => 10, :page => page,
             :conditions => ['allflex like ? OR metal1 like ? OR old_tag like ?', "%#{search}%", "%#{search}%", "%#{search}%"]
  end

  attr_accessible :allflex, :comments, :date, :metal1, :sale_id, :person_id, :breed, :sex, :old_tag, :age, :chv, :bruc, :months_pregnant, :temperature

  validates :metal1, :format => { :with => /\A\d{2}[a-zA-Z]{3}\d{4}\z/,
    :message => "Format must match: 12ABC1234" }

  def unsold_animals
    Animal.where("sold = 'f'")
  end

end
