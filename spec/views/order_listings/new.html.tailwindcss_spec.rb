require 'rails_helper'

RSpec.describe "order_listings/new", type: :view do
  before(:each) do
    assign(:order_listing, OrderListing.new(
      listing: nil,
      order: nil,
      quantity: 1
    ))
  end

  it "renders new order_listing form" do
    render

    assert_select "form[action=?][method=?]", order_listings_path, "post" do

      assert_select "input[name=?]", "order_listing[listing_id]"

      assert_select "input[name=?]", "order_listing[order_id]"

      assert_select "input[name=?]", "order_listing[quantity]"
    end
  end
end
