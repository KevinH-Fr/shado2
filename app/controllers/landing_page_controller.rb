class LandingPageController < ApplicationController

  layout 'landing_page' # Specify the layout file for the landing page
  
  def index

    if user_signed_in?
      redirect_to pages_index_path # Redirect to pages index if user is signed in
    else
      @nb_users = 50
      @nb_posts = 2100
      @nb_dons = 500
    end

  end
end
