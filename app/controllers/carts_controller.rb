class CartsController < ApplicationController
  before_action :set_cart, only: %i[ show edit update destroy ]

  def index
    @cart = current_user.cart
  
    if !@cart
      @cart_total = 0
    else
      @cart_total = calculate_cart_total(@cart)
    end
  end
    
  def show
    redirect_to carts_path
  end

  def new 
    @cart = Cart.new
  end

  def create
    @cart = current_user.cart || Cart.new(user: current_user)
    @listing = Listing.find(params[:listing_id])
  
    existing_cart_listing = @cart.cart_listings.find_by(listing: @listing)
  
    if existing_cart_listing
      existing_cart_listing.update(quantity: existing_cart_listing.quantity + 1)
      flash[:success] = 'listing quantity updated in the cart successfully.'
    else
      @cart_listing = @cart.cart_listings.build(listing: @listing)
      if @cart_listing.save
        flash[:success] = 'listing added to cart successfully.'
      else
        flash[:error] = 'An error occurred while adding the listing to the cart.'
      end
    end
  
    @cart_total = calculate_cart_total(@cart) # Calculate cart total
    redirect_to carts_path
  end
    
 
  def destroy
    @cart = current_user.cart
    if @cart.destroy
      flash[:success] = "Remove successfully an listing"
    else
      flash[:error] = "An error has been occured!"
    end
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:user_id, :listing_id, :quantity)
    end

    def calculate_cart_total(cart)
      total = 0
      cart.cart_listings.each do |cart_listing|
        total += cart_listing.listing.price * cart_listing.quantity
      end
      total
    end
  end
