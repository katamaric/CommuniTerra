require "rails_helper"

RSpec.describe OrderListingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/order_listings").to route_to("order_listings#index")
    end

    it "routes to #new" do
      expect(get: "/order_listings/new").to route_to("order_listings#new")
    end

    it "routes to #show" do
      expect(get: "/order_listings/1").to route_to("order_listings#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/order_listings/1/edit").to route_to("order_listings#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/order_listings").to route_to("order_listings#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/order_listings/1").to route_to("order_listings#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/order_listings/1").to route_to("order_listings#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/order_listings/1").to route_to("order_listings#destroy", id: "1")
    end
  end
end
