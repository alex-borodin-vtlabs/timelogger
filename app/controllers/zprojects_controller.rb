class ZprojectsController < ApplicationController
  before_action :set_zproject, only: [:show, :edit, :update, :destroy]

  # GET /zprojects
  # GET /zprojects.json
  def index
    @zprojects = Zproject.all
  end

  # GET /zprojects/1
  # GET /zprojects/1.json
  def show
  end

  # GET /zprojects/new
  def new
    @zproject = Zproject.new
  end

  # GET /zprojects/1/edit
  def edit
  end

  # POST /zprojects
  # POST /zprojects.json
  def create
    @zproject = Zproject.new(zproject_params)

    respond_to do |format|
      if @zproject.save
        format.html { redirect_to @zproject, notice: 'Zproject was successfully created.' }
        format.json { render :show, status: :created, location: @zproject }
      else
        format.html { render :new }
        format.json { render json: @zproject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zprojects/1
  # PATCH/PUT /zprojects/1.json
  def update
    respond_to do |format|
      if @zproject.update(zproject_params)
        format.html { redirect_to @zproject, notice: 'Zproject was successfully updated.' }
        format.json { render :show, status: :ok, location: @zproject }
      else
        format.html { render :edit }
        format.json { render json: @zproject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zprojects/1
  # DELETE /zprojects/1.json
  def destroy
    @zproject.destroy
    respond_to do |format|
      format.html { redirect_to zprojects_url, notice: 'Zproject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zproject
      @zproject = Zproject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zproject_params
      params.require(:zproject).permit(:name)
    end
end
