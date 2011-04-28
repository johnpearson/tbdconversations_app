class PagesController < ApplicationController
  
  # This controller will handle the static pages of home, about and contact
  # Base title is set in application_helper.rb
  def home
    @title = "Home"
  end

  def about
    @title = "About"
  end

  def contact
    @title = "Contact"
  end

end
