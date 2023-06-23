require 'rails_helper'

RSpec.describe "order_listings/edit", type: :view do
  let(:order_listing) {
    OrderListing.create!(
      listing: nil,
      order: nil,
      quantity: 1
    )
  }

  before(:each) do
    assign(:order_listing, order_listing)
  end

  it "renders the edit order_listing form" do
    render

    assert_select "form[action=?][method=?]", order_listing_path(order_listing), "post" do

      assert_select "input[name=?]", "order_listing[listing_id]"

      assert_select "input[name=?]", "order_listing[order_id]"

      assert_select "input[name=?]", "order_listing[quantity]"
    end
  end
end
