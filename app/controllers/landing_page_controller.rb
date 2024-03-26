class LandingPageController < ApplicationController

  layout 'landing_page' # Specify the layout file for the landing page
  
  def index
    @nb_users = 50
    @nb_posts = 2100
    @nb_dons = 500
  end
end
