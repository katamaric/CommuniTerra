class CartListingsController < ApplicationController
  def create
    cart = current_user.cart
    listing = Listing.find(params[:listing])
    NewCartlisting.new(cart, listing).perform
    redirect_to cart_path(cart)
    cart.update(last_activity_at: Time.now)
  end

  def update
    cart_listing = CartListing.find(params[:id])
    new_quantity = params[:quantity].to_i
    listing = cart_listing.listing

    if new_quantity <= listing.quantity
      listing.update(remaining_quantity: listing.remaining_quantity + cart_listing.quantity - new_quantity)
      cart_listing.update(quantity: new_quantity)
      redirect_to cart_path, notice: 'La quantité a bien été mise à jour.'
    else
      flash[:alert] = 'La quantité ne peut pas être modifiée.'
      redirect_to cart_path
    end
  end

  def destroy
    @cart_listing = CartListing.find(params[:id])
    @cart_listing.listing.update(remaining_quantity: @cart_listing.listing.remaining_quantity + @cart_listing.quantity)
    @cart_listing.destroy
    redirect_to cart_path, notice: "L'article a bien été enlevé de votre panier."
  end

  private 

  def destroy_inactive_carts
    Cart.where("last_activity_at < ?", 30.minutes.ago).destroy_all
  end
end
