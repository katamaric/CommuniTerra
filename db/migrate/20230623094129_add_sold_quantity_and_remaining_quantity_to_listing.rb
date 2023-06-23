class AddSoldQuantityAndRemainingQuantityToListing < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :sold_quantity, :integer, default: 0
    add_column :listings, :remaining_quantity, :integer

    Listing.all.each do |listing|
      listing.update_columns(sold_quantity: 0, remaining_quantity: listing.quantity)
    end
  end
end
