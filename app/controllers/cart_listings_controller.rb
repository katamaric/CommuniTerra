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
      redirect_to cart_path, notice: 'La quantité a bien été mise à jour.'
    else
      flash[:alert] = 'La quantité ne peut pas être modifiée.'
      redirect_to cart_path
    end
  end  

  def destroy
    @cart_listing = CartListing.find(params[:id])
    @cart_listing.destroy
    redirect_to cart_path, notice: "L'article a bien été enelevé de votre panier."
  end

end
