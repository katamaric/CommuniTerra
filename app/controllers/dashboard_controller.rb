class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @owned_plants = current_user.owned_plants
    @current_user_listings = current_user.listings
    @current_user_order_listings = OrderListing.joins(:order).where(orders: { user_id: current_user.id })
  end
end
