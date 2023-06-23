require 'rails_helper'

RSpec.describe "cart_listings/edit", type: :view do
  let(:cart_listing) {
    CartListing.create!(
      cart: nil,
      listing: nil
    )
  }

  before(:each) do
    assign(:cart_listing, cart_listing)
  end

  it "renders the edit cart_listing form" do
    render

    assert_select "form[action=?][method=?]", cart_listing_path(cart_listing), "post" do

      assert_select "input[name=?]", "cart_listing[cart_id]"

      assert_select "input[name=?]", "cart_listing[listing_id]"
    end
  end
end
