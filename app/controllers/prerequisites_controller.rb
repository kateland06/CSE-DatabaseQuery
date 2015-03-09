class PrerequisitesController < ApplicationController
  before_action :set_prerequisite, only: [:show, :edit, :update, :destroy]

  # GET /prerequisites
  # GET /prerequisites.json
  def index
    @prerequisites = Prerequisite.all
  end

  # GET /prerequisites/1
  # GET /prerequisites/1.json
  def show
  end

  # GET /prerequisites/new
  def new
    @prerequisite = Prerequisite.new
  end

  # GET /prerequisites/1/edit
  def edit
  end

  # POST /prerequisites
  # POST /prerequisites.json
  def create
    @prerequisite = Prerequisite.new(prerequisite_params)

    respond_to do |format|
      if @prerequisite.save
        format.html { redirect_to @prerequisite, notice: 'Prerequisite was successfully created.' }
        format.json { render :show, status: :created, location: @prerequisite }
      else
        format.html { render :new }
        format.json { render json: @prerequisite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prerequisites/1
  # PATCH/PUT /prerequisites/1.json
  def update
    respond_to do |format|
      if @prerequisite.update(prerequisite_params)
        format.html { redirect_to @prerequisite, notice: 'Prerequisite was successfully updated.' }
        format.json { render :show, status: :ok, location: @prerequisite }
      else
        format.html { render :edit }
        format.json { render json: @prerequisite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prerequisites/1
  # DELETE /prerequisites/1.json
  def destroy
    @prerequisite.destroy
    respond_to do |format|
      format.html { redirect_to prerequisites_url, notice: 'Prerequisite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prerequisite
      @prerequisite = Prerequisite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prerequisite_params
      params.require(:prerequisite).permit(:section_id, :student_id, :course, :year_taken, :faculty, :semester)
    end
end
