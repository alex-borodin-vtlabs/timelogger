  class TasksController < ApplicationController
  before_action :set_project
  before_action :correct_user
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = @project.tasks.all.includes(:intervals)
    respond_to do |format|
      format.json { render json:  @tasks.order("updated_at desc").to_json( include: { intervals: {} })}
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    respond_to do |format|
      format.json { render json:  @task.to_json( include: { intervals: {} })}
    end
  end



  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.json { render json: @task.to_json( include: { intervals: {} }), status: :created}
      else
        format.json { render json: {errors: @task.errors, status: 'error'}, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
   def update
    respond_to do |format|
      if @task.update(task_params)
        format.json { render json: @task.to_json( include: { intervals: {} }), status: :ok}
      else
        format.json { render json: {errors: @task.errors, status: 'error'}, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
 def destroy
    @task.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    def set_task
      @task = @project.tasks.includes(:intervals).find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :type, :project_id)
    end
end
