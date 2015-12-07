require "rails_helper"

RSpec.describe ZtasksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/ztasks").to route_to("ztasks#index")
    end

    it "routes to #new" do
      expect(:get => "/ztasks/new").to route_to("ztasks#new")
    end

    it "routes to #show" do
      expect(:get => "/ztasks/1").to route_to("ztasks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/ztasks/1/edit").to route_to("ztasks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/ztasks").to route_to("ztasks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/ztasks/1").to route_to("ztasks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/ztasks/1").to route_to("ztasks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ztasks/1").to route_to("ztasks#destroy", :id => "1")
    end

  end
end
