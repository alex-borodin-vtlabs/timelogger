require 'rails_helper'

RSpec.describe "Intervals", type: :request do

  describe "api/tasks" do
    before(:each) do
      @attrs = FactoryGirl.attributes_for(:interval)
      @task= FactoryGirl.create(:task, id: @attrs[:task_id])
      @project = FactoryGirl.create(:project, id: @task.project_id)
    end

    context "authorized" do
      login_user

      it "gets index" do
        get project_task_intervals_path(@project.id, @task.id)
        expect(response).to have_http_status(200)
      end
      it "posts and create" do
        post project_task_intervals_path(@project.id, @task.id), interval: @attrs
        expect(response).to have_http_status(201)
      end
      it "gets interval" do
        interval = FactoryGirl.create(:interval)
        get project_task_interval_path(@project.id, @task.id, interval.id), interval: interval
        expect(response).to have_http_status(200)
      end
      it "gets wrong interval" do
        project = FactoryGirl.create(:project, user_id: @second_user.id)
        task = FactoryGirl.create(:task, project_id: project.id)
        interval = FactoryGirl.create(:interval, task_id: task.id)
        get project_task_interval_path(project.id, task.id, interval.id), interval: interval.attributes
        expect(response).to have_http_status(403)
      end
      it "patchs interval" do
        interval = FactoryGirl.create(:interval)
        patch project_task_interval_path(@project.id, @task.id, interval.id), interval: interval.attributes
        expect(response).to have_http_status(200)
      end
      it "patchs wrong interval" do
        project = FactoryGirl.create(:project, user_id: @second_user.id)
        task = FactoryGirl.create(:task, project_id: project.id)
        interval = FactoryGirl.create(:interval, task_id: task.id)
        patch project_task_interval_path(project.id, task.id, interval.id), interval: interval.attributes
        expect(response).to have_http_status(403)
      end
      it "puts interval" do
        interval = FactoryGirl.create(:interval)
        put project_task_interval_path(@project.id, @task.id, interval.id), interval: interval.attributes
        expect(response).to have_http_status(200)
      end
      it "puts wrong interval" do
        project = FactoryGirl.create(:project, user_id: @second_user.id)
        task = FactoryGirl.create(:task, project_id: project.id)
        interval = FactoryGirl.create(:interval, task_id: task.id)
        put project_task_interval_path(project.id, task.id, interval.id), interval: interval.attributes
        expect(response).to have_http_status(403)
      end
      it "deletes interval" do
        interval = FactoryGirl.create(:interval)
        delete project_task_interval_path(@project.id, @task.id, interval.id), interval: interval.attributes
        expect(response).to have_http_status(204)
      end
      it "deletes wrong task" do
        project = FactoryGirl.create(:project, user_id: @second_user.id)
        task = FactoryGirl.create(:task, project_id: project.id)
        interval = FactoryGirl.create(:interval, task_id: task.id)
        delete project_task_interval_path(project.id, task.id, interval.id)
        expect(response).to have_http_status(403)
      end
    end
    context "unauthorized" do

      it "gets index" do
        get project_task_intervals_path(@project.id, @task.id)
        expect(response).to have_http_status(401)
      end
      it "posts and create" do
        post project_task_intervals_path(@project.id, @task.id), interval: @attrs
        expect(response).to have_http_status(401)
      end
      it "gets interval" do
        FactoryGirl.create(:first_user)
        interval = FactoryGirl.create(:interval)
        get project_task_interval_path(@project.id, @task.id, interval.id)
        expect(response).to have_http_status(403)
      end
      it "patchs interval" do
        interval = FactoryGirl.create(:interval)
        patch project_task_path(@project.id, @task.id, interval.id), interval: interval.attributes
        expect(response).to have_http_status(401)
      end
      it "puts interval" do
        interval = FactoryGirl.create(:interval)
        patch project_task_path(@project.id, @task.id, interval.id), interval: interval.attributes
        expect(response).to have_http_status(401)
      end
      it "deletes interval" do
        interval = FactoryGirl.create(:interval)
        delete project_task_path(@project.id, @task.id, interval.id), interval: interval.attributes
        expect(response).to have_http_status(401)
      end
    end
  end
end
