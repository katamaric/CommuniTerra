require 'rails_helper'

RSpec.describe "order_listings/show", type: :view do
  before(:each) do
    assign(:order_listing, OrderListing.create!(
      listing: nil,
      order: nil,
      quantity: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
