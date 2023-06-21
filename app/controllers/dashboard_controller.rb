class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @owned_plants = current_user.owned_plants
    @current_user_listings = current_user.listings
  end
end
