require "spec_helper"

describe PostItsController do
  describe "routing" do

    it "routes to #index" do
      get("/post_its").should route_to("post_its#index")
    end

    it "routes to #new" do
      get("/post_its/new").should route_to("post_its#new")
    end

    it "routes to #show" do
      get("/post_its/1").should route_to("post_its#show", :id => "1")
    end

    it "routes to #edit" do
      get("/post_its/1/edit").should route_to("post_its#edit", :id => "1")
    end

    it "routes to #create" do
      post("/post_its").should route_to("post_its#create")
    end

    it "routes to #update" do
      put("/post_its/1").should route_to("post_its#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/post_its/1").should route_to("post_its#destroy", :id => "1")
    end

  end
end
