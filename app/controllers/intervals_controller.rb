class IntervalsController < ApplicationController
  before_action :set_interval, only: [:show, :edit, :update, :destroy]

  # GET /intervals
  # GET /intervals.json
  def index
    @intervals = Interval.all
    respond_to do |format|
      format.json { render json:  @intervals.order("updated_at desc")}
    end
  end

  # GET /intervals/1
  # GET /intervals/1.json
  def show
    respond_to do |format|
      format.json { render json:  @interval}
    end
  end


  # POST /intervals
  # POST /intervals.json
  def create
    @interval = Interval.new(interval_params)

    respond_to do |format|
      if @interval.save
        format.json { render :show, status: :created}
      else
        format.json { render json: {errors: @task.errors, status: 'error'}, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intervals/1
  # PATCH/PUT /intervals/1.json
  def update
    respond_to do |format|
      if @interval.update(interval_params)
        format.json { render :show, status: :ok}
      else
        format.json { render json: {errors: @task.errors, status: 'error'}, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intervals/1
  # DELETE /intervals/1.json
  def destroy
    @interval.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interval
      @interval = Interval.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interval_params
      params.require(:interval).permit(:intrvlbegin, :intrvlend, :task_id)
    end
end
