require 'rails_helper'

RSpec.describe "cart_listings/new", type: :view do
  before(:each) do
    assign(:cart_listing, CartListing.new(
      cart: nil,
      listing: nil
    ))
  end

  it "renders new cart_listing form" do
    render

    assert_select "form[action=?][method=?]", cart_listings_path, "post" do

      assert_select "input[name=?]", "cart_listing[cart_id]"

      assert_select "input[name=?]", "cart_listing[listing_id]"
    end
  end
end
