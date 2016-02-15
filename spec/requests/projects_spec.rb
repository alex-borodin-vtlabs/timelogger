require 'rails_helper'

RSpec.describe "Projects", type: :request do
  describe "api/projects" do
    attrs = FactoryGirl.attributes_for(:project)

    context "authorized" do
      login_user

      it "gets index" do
        get projects_path
        expect(response).to have_http_status(200)
      end
      it "posts and create" do
        post projects_path, project: attrs
        expect(response).to have_http_status(201)
      end
      it "posts no user" do
        post projects_path, project: attrs.except(:user_id)
        expect(response).to have_http_status(201)
      end
      it "posts no title" do
        post projects_path, project: attrs.except(:title)
        expect(response).to have_http_status(422)
      end
      it "gets project" do
        project = FactoryGirl.create(:project)
        get project_path(project)
        expect(response).to have_http_status(200)
      end
      it "gets wrong project" do
        project = FactoryGirl.create(:project, user_id: @second_user.id)
        get project_path(project)
        expect(response).to have_http_status(403)
      end
      it "patchs project" do
        project = FactoryGirl.create(:project)
        patch project_path(project), project: project.attributes
        expect(response).to have_http_status(200)
      end
      it "patchs wrong project" do
        project = FactoryGirl.create(:project, user_id: @second_user.id)
        patch project_path(project), project: project.attributes
        expect(response).to have_http_status(403)
      end
      it "puts project" do
        project = FactoryGirl.create(:project)
        put project_path(project), project: project.attributes.except(:title)
        expect(response).to have_http_status(200)
      end
      it "puts wrong project" do
        project = FactoryGirl.create(:project, user_id: @second_user.id)
        put project_path(project), project: project.attributes.except(:title)
        expect(response).to have_http_status(403)
      end
      it "deletes project" do
        project = FactoryGirl.create(:project)
        delete project_path(project)
        expect(response).to have_http_status(204)
      end
      it "deletes wrong project" do
        project = FactoryGirl.create(:project, user_id: @second_user.id)
        delete project_path(project)
        expect(response).to have_http_status(403)
      end
    end
    context "unauthorized" do

      it "gets index" do
        get projects_path
        expect(response).to have_http_status(401)
      end
      it "posts and create" do
        post projects_path, project: attrs
        expect(response).to have_http_status(401)
      end
      it "posts no user" do
        post projects_path, project: attrs.except(:user_id)
        expect(response).to have_http_status(401)
      end
      it "posts no title" do
        post projects_path, project: attrs.except(:title)
        expect(response).to have_http_status(401)
      end
      it "gets project" do
        FactoryGirl.create(:first_user)
        project = FactoryGirl.create(:project)
        get project_path(project)
        expect(response).to have_http_status(403)
      end
      it "patchs project" do
        project = FactoryGirl.create(:project)
        patch project_path(project), project: project.attributes
        expect(response).to have_http_status(401)
      end
      it "puts project" do
        project = FactoryGirl.create(:project)
        put project_path(project), project: project.attributes.except(:title)
        expect(response).to have_http_status(401)
      end
      it "deletes project" do
        project = FactoryGirl.create(:project)
        delete project_path(project)
        expect(response).to have_http_status(401)
      end
    end
  end
end
