require "rails_helper"

RSpec.describe ZtasksController, type: :routing do
  describe "routing" do


    it "routes to #new" do
      expect(:get => "/zprojects/1/ztasks/new").to route_to("ztasks#new", :zproject_id => "1")
    end

    it "routes to #show" do
      expect(:get => "/zprojects/1/ztasks/1").to route_to("ztasks#show", :id => "1", :zproject_id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/zprojects/1/ztasks/1/edit").to route_to("ztasks#edit", :id => "1", :zproject_id => "1")
    end

    it "routes to #create" do
      expect(:post => "/zprojects/1/ztasks").to route_to("ztasks#create", :zproject_id => "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/zprojects/1/ztasks/1").to route_to("ztasks#update", :id => "1", :zproject_id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/zprojects/1/ztasks/1").to route_to("ztasks#update", :id => "1", :zproject_id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/zprojects/1/ztasks/1").to route_to("ztasks#destroy", :id => "1", :zproject_id => "1")
    end

  end
end
