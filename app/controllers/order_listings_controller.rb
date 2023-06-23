class OrderListingsController < ApplicationController
  before_action :set_order_listing, only: %i[ show edit update destroy ]

  # GET /order_listings or /order_listings.json
  def index
    @order_listings = OrderListing.all
  end

  # GET /order_listings/1 or /order_listings/1.json
  def show
  end

  # GET /order_listings/new
  def new
    @order_listing = OrderListing.new
  end

  # GET /order_listings/1/edit
  def edit
  end

  # POST /order_listings or /order_listings.json
  def create
    @order_listing = OrderListing.new(order_listing_params)

    respond_to do |format|
      if @order_listing.save
        format.html { redirect_to order_listing_url(@order_listing), notice: "Order listing was successfully created." }
        format.json { render :show, status: :created, location: @order_listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_listings/1 or /order_listings/1.json
  def update
    respond_to do |format|
      if @order_listing.update(order_listing_params)
        format.html { redirect_to order_listing_url(@order_listing), notice: "Order listing was successfully updated." }
        format.json { render :show, status: :ok, location: @order_listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_listings/1 or /order_listings/1.json
  def destroy
    @order_listing.destroy

    respond_to do |format|
      format.html { redirect_to order_listings_url, notice: "Order listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_listing
      @order_listing = OrderListing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_listing_params
      params.require(:order_listing).permit(:listing_id, :order_id, :quantity)
    end
end
