module SalesHelper

  def name
    name = (@sale.person.firstname + " " + @sale.person.lastname)
  end
  
end
