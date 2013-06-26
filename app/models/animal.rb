# == Schema Information
#
# Table name: animals
#
#  id              :integer          not null, primary key
#  date            :date
#  metal1          :string(255)
#  allflex         :string(255)
#  comments        :text
#  sale_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  sold            :boolean          default(FALSE)
#  temperature     :string(255)
#  old_tag         :string(255)
#  months_pregnant :string(255)
#  bruc            :string(255)
#  chv             :string(255)
#  breed           :string(255)
#  sex             :string(255)
#  age             :string(255)
#  person_id       :integer
#

class Animal < ActiveRecord::Base
  attr_accessible :allflex, :comments, :date, :metal1, :sale_id, :person_id, :breed, :sex, :old_tag, :age, :chv, :bruc, :months_pregnant, :temperature, :date_string

  belongs_to :sale
  belongs_to :person
  belongs_to :cvi

  validates :person_id, :presence => true
  validates :metal1, :format => { :with => /\A\d{2}[a-zA-Z]{3}\d{4}\z/, :message => "format must match: 12ABC1234" }
  validates :date, :date => { :message => 'must be a date with the format mm/dd/yyyy.' }

  def date_string
    date
  end

  def date_string=(date_str)
    self.date = Date.strptime(date_str, "%m/%d/%Y")
  end

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
