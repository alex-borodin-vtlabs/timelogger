require "rails_helper"

RSpec.describe IntervalsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/intervals").to route_to("intervals#index")
    end

    it "routes to #new" do
      expect(:get => "/intervals/new").to route_to("intervals#new")
    end

    it "routes to #show" do
      expect(:get => "/intervals/1").to route_to("intervals#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/intervals/1/edit").to route_to("intervals#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/intervals").to route_to("intervals#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/intervals/1").to route_to("intervals#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/intervals/1").to route_to("intervals#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/intervals/1").to route_to("intervals#destroy", :id => "1")
    end

  end
end
