class Animal < ActiveRecord::Base
  attr_accessible :allflex, :comments, :date, :metal1, :sale_id, :person_id, :breed, :sex, :old_tag, :age, :chv, :bruc, :months_pregnant, :temperature

  belongs_to :sale
  belongs_to :person
  belongs_to :cvi

  validates :person_id, :presence => true
  validates :metal1, :format => { :with => /\A\d{2}[a-zA-Z]{3}\d{4}\z/, :message => "Format must match: 12ABC1234" }

  def self.search(search)
    if search
      where('allflex like ? OR metal1 like ? OR old_tag like ?', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end

  def unsold_animals
    Animal.where("sold = 'f'")
  end

end
