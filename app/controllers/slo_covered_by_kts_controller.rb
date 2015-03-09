class SloCoveredByKtsController < ApplicationController
  before_action :set_slo_covered_by_kt, only: [:show, :edit, :update, :destroy]

  # GET /slo_covered_by_kts
  # GET /slo_covered_by_kts.json
  def index
    @slo_covered_by_kts = SloCoveredByKt.all
  end

  # GET /slo_covered_by_kts/1
  # GET /slo_covered_by_kts/1.json
  def show
  end

  # GET /slo_covered_by_kts/new
  def new
    @slo_covered_by_kt = SloCoveredByKt.new
  end

  # GET /slo_covered_by_kts/1/edit
  def edit
  end

  # POST /slo_covered_by_kts
  # POST /slo_covered_by_kts.json
  def create
    @slo_covered_by_kt = SloCoveredByKt.new(slo_covered_by_kt_params)

    respond_to do |format|
      if @slo_covered_by_kt.save
        format.html { redirect_to @slo_covered_by_kt, notice: 'Slo covered by kt was successfully created.' }
        format.json { render :show, status: :created, location: @slo_covered_by_kt }
      else
        format.html { render :new }
        format.json { render json: @slo_covered_by_kt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slo_covered_by_kts/1
  # PATCH/PUT /slo_covered_by_kts/1.json
  def update
    respond_to do |format|
      if @slo_covered_by_kt.update(slo_covered_by_kt_params)
        format.html { redirect_to @slo_covered_by_kt, notice: 'Slo covered by kt was successfully updated.' }
        format.json { render :show, status: :ok, location: @slo_covered_by_kt }
      else
        format.html { render :edit }
        format.json { render json: @slo_covered_by_kt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slo_covered_by_kts/1
  # DELETE /slo_covered_by_kts/1.json
  def destroy
    @slo_covered_by_kt.destroy
    respond_to do |format|
      format.html { redirect_to slo_covered_by_kts_url, notice: 'Slo covered by kt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slo_covered_by_kt
      @slo_covered_by_kt = SloCoveredByKt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slo_covered_by_kt_params
      params.require(:slo_covered_by_kt).permit(:student_learning_outcome_id, :knowledge_topic_id)
    end
end
