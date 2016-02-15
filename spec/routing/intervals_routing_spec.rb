require "rails_helper"

RSpec.describe IntervalsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "api/projects/1/tasks/1/intervals").to route_to("intervals#index", "project_id"=>"1", "task_id"=>"1", :format => "json")
    end


    it "routes to #show" do
      expect(:get => "api/projects/1/tasks/1/intervals/1").to route_to("intervals#show", :id => "1", "project_id"=>"1", "task_id"=>"1", :format => "json")
    end


    it "routes to #create" do
      expect(:post => "api/projects/1/tasks/1/intervals").to route_to("intervals#create", "project_id"=>"1", "task_id"=>"1", :format => "json")
    end

    it "routes to #update via PUT" do
      expect(:put => "api/projects/1/tasks/1/intervals/1").to route_to("intervals#update", :id => "1", "project_id"=>"1", "task_id"=>"1", :format => "json")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "api/projects/1/tasks/1/intervals/1").to route_to("intervals#update", :id => "1", "project_id"=>"1", "task_id"=>"1", :format => "json")
    end

    it "routes to #destroy" do
      expect(:delete => "api/projects/1/tasks/1/intervals/1").to route_to("intervals#destroy", :id => "1", "project_id"=>"1", "task_id"=>"1", :format => "json")
    end

  end
end
