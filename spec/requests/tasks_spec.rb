require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "api/tasks" do
    before(:each) do
      @attrs = FactoryGirl.attributes_for(:task)

      @project = FactoryGirl.create(:project, id: @attrs[:project_id])
    end

    context "authorized" do
      login_user

      it "gets index" do
        get project_tasks_path(@project.id)
        expect(response).to have_http_status(200)
      end
      it "posts and create" do
        post project_tasks_path(@project.id), task: @attrs
        expect(response).to have_http_status(201)
      end
      it "posts no name" do
        post project_tasks_path(@project.id), task: @attrs.except(:name)
        expect(response).to have_http_status(422)
      end
      it "gets task" do
        task = FactoryGirl.create(:task)
        get project_task_path(@project.id, task.id), task: task
        expect(response).to have_http_status(200)
      end
      it "gets wrong task" do
        project = FactoryGirl.create(:project, user_id: @second_user.id)
        task = FactoryGirl.create(:task, project_id: project.id)
        get project_task_path(project.id, task.id), task: task.attributes
        expect(response).to have_http_status(403)
      end
      it "patchs task" do
        task = FactoryGirl.create(:task)
        patch project_task_path(@project.id, task.id), task: task.attributes
        expect(response).to have_http_status(200)
      end
      it "patchs wrong task" do
        project = FactoryGirl.create(:project, user_id: @second_user.id)
        task = FactoryGirl.create(:task, project_id: project.id)
        patch project_task_path(project.id, task.id), task: task.attributes
        expect(response).to have_http_status(403)
      end
      it "puts task" do
        task = FactoryGirl.create(:task)
        put project_task_path(@project.id, task.id), task: task.attributes
        expect(response).to have_http_status(200)
      end
      it "puts wrong task" do
        project = FactoryGirl.create(:project, user_id: @second_user.id)
        task = FactoryGirl.create(:task, project_id: project.id)
        put project_task_path(project.id, task.id), task: task.attributes
        expect(response).to have_http_status(403)
      end
      it "deletes task" do
        task = FactoryGirl.create(:task)
        delete project_task_path(@project.id, task.id), task: task.attributes
        expect(response).to have_http_status(204)
      end
      it "deletes wrong task" do
        project = FactoryGirl.create(:project, user_id: @second_user.id)
        task = FactoryGirl.create(:task, project_id: project.id)
        delete project_task_path(project.id, task.id)
        expect(response).to have_http_status(403)
      end
    end
    context "unauthorized" do

      it "gets index" do
        get project_tasks_path(@project.id)
        expect(response).to have_http_status(401)
      end
      it "posts and create" do
        post project_tasks_path(@project.id), task: @attrs
        expect(response).to have_http_status(401)
      end
      it "posts no name" do
        post project_tasks_path(@project.id), task: @attrs.except(:name)
        expect(response).to have_http_status(401)
      end
      it "gets task" do
        FactoryGirl.create(:first_user)
        task = FactoryGirl.create(:task)
        get project_task_path(@project.id, task.id), task: task
        expect(response).to have_http_status(403)
      end
      it "patchs task" do
        task = FactoryGirl.create(:task)
        patch project_task_path(@project.id, task.id), task: task.attributes
        expect(response).to have_http_status(401)
      end
      it "puts task" do
        task = FactoryGirl.create(:task)
        put project_task_path(@project.id, task.id), task: task.attributes
        expect(response).to have_http_status(401)
      end
      it "deletes task" do
        task = FactoryGirl.create(:task)
        delete project_task_path(@project.id, task.id), task: task.attributes
        expect(response).to have_http_status(401)
      end
    end
  end
end
