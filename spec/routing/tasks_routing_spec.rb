require "rails_helper"

RSpec.describe TasksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "api/projects/1/tasks").to route_to("tasks#index", "project_id"=>"1", :format => "json")
    end

    it "routes to #show" do
      expect(:get => "api/projects/1/tasks/1").to route_to("tasks#show", "project_id"=>"1", :id => "1", :format => "json")
    end

    it "routes to #create" do
      expect(:post => "api/projects/1/tasks").to route_to("tasks#create", "project_id"=>"1", :format => "json")
    end

    it "routes to #update via PUT" do
      expect(:put => "api/projects/1/tasks/1").to route_to("tasks#update", "project_id"=>"1", :id => "1", :format => "json")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "api/projects/1/tasks/1").to route_to("tasks#update", "project_id"=>"1", :id => "1", :format => "json")
    end

    it "routes to #destroy" do
      expect(:delete => "api/projects/1/tasks/1").to route_to("tasks#destroy", "project_id"=>"1", :id => "1", :format => "json")
    end

  end
end
