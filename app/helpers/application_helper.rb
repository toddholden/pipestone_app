module ApplicationHelper

  #def signed_in_user
  #  unless signed_in?
  #    store_location
  #    redirect_to signin_url, notice: "Please sign in."
  #  end
  #end
  
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end

end
