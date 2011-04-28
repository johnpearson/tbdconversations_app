module ApplicationHelper
  
  # Sets base title
  def title
    base_title = "Technology by Design Conversations"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  # Logo definition for abstraction from header
  def logo
      logo = image_tag("tbdheader.png", :alt => "TBD Header", :class => "round")
    end
  end
end
