module SalesHelper

 # def people_array 
 #   Person.all.to_a
 # end 
  def name
    name = (@sale.person.firstname + " " + @sale.person.lastname)
  end

end
