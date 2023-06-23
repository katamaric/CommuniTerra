require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/order_listings", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # OrderListing. As you add validations to OrderListing, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      OrderListing.create! valid_attributes
      get order_listings_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      order_listing = OrderListing.create! valid_attributes
      get order_listing_url(order_listing)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_order_listing_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      order_listing = OrderListing.create! valid_attributes
      get edit_order_listing_url(order_listing)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new OrderListing" do
        expect {
          post order_listings_url, params: { order_listing: valid_attributes }
        }.to change(OrderListing, :count).by(1)
      end

      it "redirects to the created order_listing" do
        post order_listings_url, params: { order_listing: valid_attributes }
        expect(response).to redirect_to(order_listing_url(OrderListing.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new OrderListing" do
        expect {
          post order_listings_url, params: { order_listing: invalid_attributes }
        }.to change(OrderListing, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post order_listings_url, params: { order_listing: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested order_listing" do
        order_listing = OrderListing.create! valid_attributes
        patch order_listing_url(order_listing), params: { order_listing: new_attributes }
        order_listing.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the order_listing" do
        order_listing = OrderListing.create! valid_attributes
        patch order_listing_url(order_listing), params: { order_listing: new_attributes }
        order_listing.reload
        expect(response).to redirect_to(order_listing_url(order_listing))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        order_listing = OrderListing.create! valid_attributes
        patch order_listing_url(order_listing), params: { order_listing: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested order_listing" do
      order_listing = OrderListing.create! valid_attributes
      expect {
        delete order_listing_url(order_listing)
      }.to change(OrderListing, :count).by(-1)
    end

    it "redirects to the order_listings list" do
      order_listing = OrderListing.create! valid_attributes
      delete order_listing_url(order_listing)
      expect(response).to redirect_to(order_listings_url)
    end
  end
end