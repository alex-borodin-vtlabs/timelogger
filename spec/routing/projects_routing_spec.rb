require "rails_helper"

RSpec.describe ProjectsController, type: :routing do

  describe "authenticated routing" do

    #login_user


    it "routes to #index" do
      expect(:get => "/api/projects").to route_to("projects#index", :format => "json")
    end

    it "routes to #show" do
      expect(:get => "/api/projects/1").to route_to("projects#show", :id => "1", :format => "json")
    end

    it "routes to #create" do
      expect(:post => "/api/projects").to route_to("projects#create", :format => "json")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/projects/1").to route_to("projects#update", :id => "1", :format => "json")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/projects/1").to route_to("projects#update", :id => "1", :format => "json")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/projects/1").to route_to("projects#destroy", :id => "1", :format => "json")
    end

  end
end
