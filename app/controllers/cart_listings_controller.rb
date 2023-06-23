class CartListingsController < ApplicationController

	def create
    cart = current_user.cart
    listing = Listing.find(params[:listing])
		NewCartlisting.new(cart, listing).perform
		redirect_to cart_path(cart)
  end

  def update
    cart_listing = CartListing.find(params[:id])
    new_quantity = params[:quantity].to_i
    listing = cart_listing.listing
  
    if new_quantity <= listing.remaining_quantity
      cart_listing.update(quantity: new_quantity)
      redirect_to cart_path, notice: 'Quantity updated successfully.'
    else
      flash[:alert] = 'The requested quantity exceeds the available quantity for this listing.'
      redirect_to cart_path
    end
  end  

  def destroy
    @cart_listing = Cartlisting.find(params[:id])
    @cart_listing.destroy
    redirect_to cart_path, notice: "listing removed from cart."
  end

end
