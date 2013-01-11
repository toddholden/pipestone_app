module AnimalsHelper


  def full_title(page_title)
    base_title = "Pipestone Database"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

end
