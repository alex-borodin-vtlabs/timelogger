class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!, except: :show
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, if: :json_request?
  layout 'landing', only: :show
  #layout 'application'
  def index
		render text: nil, layout: true
  end
  def show
    render text: nil, layout: true
  end

  private

  def json_request?
    request.format.json?
  end
  def correct_user
    @user = User.find(@project.user_id)
    unless @user == current_user then
      respond_to do |format|
          format.json { render json: {status: 'Access Denied'}, status: 403 }
      end
    end
  end
  def set_project
    @project = Project.find(params[:project_id])
    print @project
  end
  def set_task
    @task = @project.tasks.includes(:intervals).find(params[:task_id])
  end
end
