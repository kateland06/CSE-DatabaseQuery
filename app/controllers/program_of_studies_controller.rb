class ProgramOfStudiesController < ApplicationController
  before_action :set_program_of_study, only: [:show, :edit, :update, :destroy]

  # GET /program_of_studies
  # GET /program_of_studies.json
  def index
    @program_of_studies = ProgramOfStudy.all
  end

  # GET /program_of_studies/1
  # GET /program_of_studies/1.json
  def show
  end

  # GET /program_of_studies/new
  def new
    @program_of_study = ProgramOfStudy.new
  end

  # GET /program_of_studies/1/edit
  def edit
  end

  # POST /program_of_studies
  # POST /program_of_studies.json
  def create
    @program_of_study = ProgramOfStudy.new(program_of_study_params)

    respond_to do |format|
      if @program_of_study.save
        format.html { redirect_to @program_of_study, notice: 'Program of study was successfully created.' }
        format.json { render :show, status: :created, location: @program_of_study }
      else
        format.html { render :new }
        format.json { render json: @program_of_study.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /program_of_studies/1
  # PATCH/PUT /program_of_studies/1.json
  def update
    respond_to do |format|
      if @program_of_study.update(program_of_study_params)
        format.html { redirect_to @program_of_study, notice: 'Program of study was successfully updated.' }
        format.json { render :show, status: :ok, location: @program_of_study }
      else
        format.html { render :edit }
        format.json { render json: @program_of_study.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /program_of_studies/1
  # DELETE /program_of_studies/1.json
  def destroy
    @program_of_study.destroy
    respond_to do |format|
      format.html { redirect_to program_of_studies_url, notice: 'Program of study was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program_of_study
      @program_of_study = ProgramOfStudy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_of_study_params
      params.require(:program_of_study).permit(:program, :section_id)
    end
end
