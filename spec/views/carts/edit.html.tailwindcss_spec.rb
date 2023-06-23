require 'rails_helper'

RSpec.describe "carts/edit", type: :view do
  let(:cart) {
    Cart.create!(
      user: nil,
      listing: nil,
      quantity: 1
    )
  }

  before(:each) do
    assign(:cart, cart)
  end

  it "renders the edit cart form" do
    render

    assert_select "form[action=?][method=?]", cart_path(cart), "post" do

      assert_select "input[name=?]", "cart[user_id]"

      assert_select "input[name=?]", "cart[listing_id]"

      assert_select "input[name=?]", "cart[quantity]"
    end
  end
end
