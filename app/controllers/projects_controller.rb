
class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
    respond_to do |format|
  		format.json { render json:  @projects.order("updated_at desc")}
	end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    respond_to do |format|
  		format.json { render json:  @project}
	end
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.json { render json: @project, status: :created}
      else
        format.json { render json: {errors: @project.errors, status: 'error'}, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.json { render json: @project, status: :ok}
      else
        format.json { render json: {errors: @project.errors, status: 'error'}, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:user_id, :title)
    end
end
