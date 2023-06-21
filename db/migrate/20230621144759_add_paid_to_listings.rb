class AddPaidToListings < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :paid, :boolean, default: false
  end
end
