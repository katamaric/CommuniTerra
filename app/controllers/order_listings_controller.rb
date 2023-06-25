class OrderListingsController < ApplicationController
  before_action :set_order_listing, only: %i[ show edit update destroy ]

  def index
    @order_listings = OrderListing.all
  end

  def show
  end

  def new
    @order_listing = OrderListing.new
  end

  def edit
  end

  def create
    @order_listing = OrderListing.new(order_listing_params)

    if @order_listing.save
      redirect_to order_listing_url(@order_listing), notice: "Order listing was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @order_listing.update(order_listing_params)
      redirect_to order_listing_url(@order_listing), notice: "Order listing was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @order_listing.destroy
    redirect_to order_listings_url, notice: "Order listing was successfully destroyed."
  end

  private
  
  def set_order_listing
    @order_listing = OrderListing.find(params[:id])
  end

  def order_listing_params
    params.require(:order_listing).permit(:listing_id, :order_id, :quantity)
  end
end