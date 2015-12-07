class ZtasksController < ApplicationController
  before_action :set_ztask, only: [:show, :edit, :update, :destroy]

  # GET /ztasks
  # GET /ztasks.json
  def index
    @ztasks = Ztask.all
  end

  # GET /ztasks/1
  # GET /ztasks/1.json
  def show
  end

  # GET /ztasks/new
  def new
    @ztask = Ztask.new
  end

  # GET /ztasks/1/edit
  def edit
  end

  # POST /ztasks
  # POST /ztasks.json
  def create
    @ztask = Ztask.new(ztask_params)

    respond_to do |format|
      if @ztask.save
        format.html { redirect_to @ztask, notice: 'Ztask was successfully created.' }
        format.json { render :show, status: :created, location: @ztask }
      else
        format.html { render :new }
        format.json { render json: @ztask.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ztasks/1
  # PATCH/PUT /ztasks/1.json
  def update
    respond_to do |format|
      if @ztask.update(ztask_params)
        format.html { redirect_to @ztask, notice: 'Ztask was successfully updated.' }
        format.json { render :show, status: :ok, location: @ztask }
      else
        format.html { render :edit }
        format.json { render json: @ztask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ztasks/1
  # DELETE /ztasks/1.json
  def destroy
    @ztask.destroy
    respond_to do |format|
      format.html { redirect_to ztasks_url, notice: 'Ztask was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ztask
      @ztask = Ztask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ztask_params
      params.require(:ztask).permit(:name, :zproject_id)
    end
end
