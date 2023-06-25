class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: %i[ show edit update destroy ]

  def index
    @current_user_listings = current_user.listings
    @listings = Listing.where("quantity > 0")
  end  

  def show
  end

  def new
    @listing = Listing.new
  end

  def edit
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.remaining_quantity = @listing.quantity

    if @listing.save
      redirect_to listings_url, notice: "L'article a bien été créé."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @listing.update(listing_params) && @listing.user == current_user
      redirect_to listing_url(@listing), notice: "L'article a bien été modifié."
    else
      render :edit, status: :unprocessable_entity
    end
  end  

  def destroy
    if @listing.user == current_user
      @listing.destroy
      redirect_to listings_url, notice: "L'article a bien été supprimé."
    else
      redirect_to listing_url(@listing), alert: "Vous n'êtes pas autorisé à supprimer cet article."
    end
  end
  
  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:user_id, :listing_title, :item_name, :description, :price, :quantity, :delivery_id)
  end
end