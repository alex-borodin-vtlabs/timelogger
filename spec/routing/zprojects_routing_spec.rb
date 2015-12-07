require "rails_helper"

RSpec.describe ZprojectsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/zprojects").to route_to("zprojects#index")
    end

    it "routes to #new" do
      expect(:get => "/zprojects/new").to route_to("zprojects#new")
    end

    it "routes to #show" do
      expect(:get => "/zprojects/1").to route_to("zprojects#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/zprojects/1/edit").to route_to("zprojects#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/zprojects").to route_to("zprojects#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/zprojects/1").to route_to("zprojects#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/zprojects/1").to route_to("zprojects#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/zprojects/1").to route_to("zprojects#destroy", :id => "1")
    end

  end
end
