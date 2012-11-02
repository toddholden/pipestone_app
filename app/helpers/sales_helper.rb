module SalesHelper

  def name
    name = (@sale.person.firstname + " " + @sale.person.lastname)
  end
  
  # attempting to make the method above work on the index page
  # which generates the following error: undefined method 'person' for nil:NilClass
  #def person
  #  person = 
end
