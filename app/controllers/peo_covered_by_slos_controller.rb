class PeoCoveredBySlosController < ApplicationController
  before_action :set_peo_covered_by_slo, only: [:show, :edit, :update, :destroy]

  # GET /peo_covered_by_slos
  # GET /peo_covered_by_slos.json
  def index
    @peo_covered_by_slos = PeoCoveredBySlo.all
  end

  # GET /peo_covered_by_slos/1
  # GET /peo_covered_by_slos/1.json
  def show
  end

  # GET /peo_covered_by_slos/new
  def new
    @peo_covered_by_slo = PeoCoveredBySlo.new
  end

  # GET /peo_covered_by_slos/1/edit
  def edit
  end

  # POST /peo_covered_by_slos
  # POST /peo_covered_by_slos.json
  def create
    @peo_covered_by_slo = PeoCoveredBySlo.new(peo_covered_by_slo_params)

    respond_to do |format|
      if @peo_covered_by_slo.save
        format.html { redirect_to @peo_covered_by_slo, notice: 'Peo covered by slo was successfully created.' }
        format.json { render :show, status: :created, location: @peo_covered_by_slo }
      else
        format.html { render :new }
        format.json { render json: @peo_covered_by_slo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /peo_covered_by_slos/1
  # PATCH/PUT /peo_covered_by_slos/1.json
  def update
    respond_to do |format|
      if @peo_covered_by_slo.update(peo_covered_by_slo_params)
        format.html { redirect_to @peo_covered_by_slo, notice: 'Peo covered by slo was successfully updated.' }
        format.json { render :show, status: :ok, location: @peo_covered_by_slo }
      else
        format.html { render :edit }
        format.json { render json: @peo_covered_by_slo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peo_covered_by_slos/1
  # DELETE /peo_covered_by_slos/1.json
  def destroy
    @peo_covered_by_slo.destroy
    respond_to do |format|
      format.html { redirect_to peo_covered_by_slos_url, notice: 'Peo covered by slo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_peo_covered_by_slo
      @peo_covered_by_slo = PeoCoveredBySlo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def peo_covered_by_slo_params
      params.require(:peo_covered_by_slo).permit(:student_learning_outcome_id, :program_educational_objective_id)
    end
end
