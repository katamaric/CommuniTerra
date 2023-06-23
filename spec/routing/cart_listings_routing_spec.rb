require "rails_helper"

RSpec.describe CartListingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/cart_listings").to route_to("cart_listings#index")
    end

    it "routes to #new" do
      expect(get: "/cart_listings/new").to route_to("cart_listings#new")
    end

    it "routes to #show" do
      expect(get: "/cart_listings/1").to route_to("cart_listings#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/cart_listings/1/edit").to route_to("cart_listings#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/cart_listings").to route_to("cart_listings#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/cart_listings/1").to route_to("cart_listings#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/cart_listings/1").to route_to("cart_listings#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/cart_listings/1").to route_to("cart_listings#destroy", id: "1")
    end
  end
end
