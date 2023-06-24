class CartsController < ApplicationController
  def index
    @cart = current_user.cart
  
    if @cart.present?
      @delivery_price = @cart.listings.joins(:delivery).sum('deliveries.delivery_price')
      @cart_total = calculate_cart_total(@cart)
    else
      @cart_total = 0
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
    @delivery_price = @listing.delivery.delivery_price
    @cart.update(last_activity_at: Time.now)
  
    if @listing.remaining_quantity >= 1
      existing_cart_listing = @cart.cart_listings.find_by(listing: @listing)
  
      if existing_cart_listing
        existing_quantity = existing_cart_listing.quantity
        requested_quantity = existing_quantity + 1
  
        if requested_quantity <= @listing.remaining_quantity
          existing_cart_listing.update(quantity: requested_quantity)
          @listing.update(remaining_quantity: @listing.remaining_quantity - 1)
          flash[:success] = 'Listing quantity updated in the cart successfully.'
        else
          flash[:error] = 'Not enough quantity available.'
        end
      else
        @cart_listing = @cart.cart_listings.build(listing: @listing)
  
        if @listing.remaining_quantity >= 1
          if @cart_listing.save
            @listing.update(remaining_quantity: @listing.remaining_quantity - 1)
            flash[:success] = 'Listing added to cart successfully.'
          else
            flash[:error] = 'An error occurred while adding the listing to the cart.'
          end
        else
          flash[:error] = 'The listing is out of stock.'
        end
      end
    else
      flash[:error] = 'The listing is out of stock.'
    end
    
    @cart_total = calculate_cart_total(@cart)
    redirect_to carts_path
  end
  
 
  def destroy
    @cart = current_user.cart
    if @cart.present?
      @cart.cart_listings.each do |cart_listing|
        listing = cart_listing.listing
        listing.update(remaining_quantity: listing.remaining_quantity + cart_listing.quantity)
      end
      if @cart.destroy
        flash[:success] = 'Cart removed successfully.'
      else
        flash[:error] = 'An error occurred while removing the cart.'
      end
    end
    redirect_to root_path
  end
  

  private

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

  def destroy_inactive_carts
    Cart.where("last_activity_at < ?", 30.minutes.ago).destroy_all
  end
end
