require 'rails_helper'

RSpec.describe "cart_listings/show", type: :view do
  before(:each) do
    assign(:cart_listing, CartListing.create!(
      cart: nil,
      listing: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
