class CartListingsController < ApplicationController

	def create
    cart = current_user.cart
    listing = Listing.find(params[:listing])
		NewCartlisting.new(cart, listing).perform
		redirect_to cart_path(cart)
  end

  def update
    cart_listing = CartListing.find(params[:id])
    cart_listing.update(quantity: params[:quantity])
    redirect_to cart_path, notice: "Quantity updated successfully."
  end
  

  def destroy
    @cart_listing = Cartlisting.find(params[:id])
    @cart_listing.destroy
    redirect_to cart_path, notice: "listing removed from cart."
  end

end
