require "rails_helper"

RSpec.describe PhotoTagsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/photo_tags").to route_to("photo_tags#index")
    end

    it "routes to #new" do
      expect(get: "/photo_tags/new").to route_to("photo_tags#new")
    end

    it "routes to #show" do
      expect(get: "/photo_tags/1").to route_to("photo_tags#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/photo_tags/1/edit").to route_to("photo_tags#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/photo_tags").to route_to("photo_tags#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/photo_tags/1").to route_to("photo_tags#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/photo_tags/1").to route_to("photo_tags#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/photo_tags/1").to route_to("photo_tags#destroy", id: "1")
    end
  end
end
