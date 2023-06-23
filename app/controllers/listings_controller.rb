class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: %i[ show edit update destroy ]

  # GET /listings or /listings.json
  def index
    @current_user_listings = current_user.listings
    @listings = Listing.where("quantity > 0")
  end  

  # GET /listings/1 or /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings or /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.remaining_quantity = @listing.quantity

    respond_to do |format|
      if @listing.save
        format.html { redirect_to listings_url, notice: "L'article a bien été créé." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params) && @listing.user == current_user
        format.html { redirect_to listing_url(@listing), notice: "L'article a bien été modifié." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end  

  # DELETE /listings/1 or /listings/1.json
  def destroy
    if @listing.user == current_user
      @listing.destroy
      respond_to do |format|
        format.html { redirect_to listings_url, notice: "L'article a bien été supprimé." }
        format.json { head :no_content }
      end
    else
      # Gérer le cas où l'utilisateur actuel n'est pas autorisé à supprimer la liste
      respond_to do |format|
        format.html { redirect_to listing_url(@listing), alert: "Vous n'êtes pas autorisé à supprimer cet article." }
        format.json { render json: { error: "Unauthorized" }, status: :unauthorized }
      end
    end
  end
  

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_listing
    @listing = Listing.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def listing_params
    params.require(:listing).permit(:user_id, :listing_title, :item_name, :description, :price, :quantity, :delivery_id)
  end
end
