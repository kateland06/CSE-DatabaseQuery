class ProgramEducationalObjectivesController < ApplicationController
  before_action :set_program_educational_objective, only: [:show, :edit, :update, :destroy]

  # GET /program_educational_objectives
  # GET /program_educational_objectives.json
  def index
    @program_educational_objectives = ProgramEducationalObjective.all
  end

  # GET /program_educational_objectives/1
  # GET /program_educational_objectives/1.json
  def show
  end

  # GET /program_educational_objectives/new
  def new
    @program_educational_objective = ProgramEducationalObjective.new
  end

  # GET /program_educational_objectives/1/edit
  def edit
  end

  # POST /program_educational_objectives
  # POST /program_educational_objectives.json
  def create
    @program_educational_objective = ProgramEducationalObjective.new(program_educational_objective_params)

    respond_to do |format|
      if @program_educational_objective.save
        format.html { redirect_to @program_educational_objective, notice: 'Program educational objective was successfully created.' }
        format.json { render :show, status: :created, location: @program_educational_objective }
      else
        format.html { render :new }
        format.json { render json: @program_educational_objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /program_educational_objectives/1
  # PATCH/PUT /program_educational_objectives/1.json
  def update
    respond_to do |format|
      if @program_educational_objective.update(program_educational_objective_params)
        format.html { redirect_to @program_educational_objective, notice: 'Program educational objective was successfully updated.' }
        format.json { render :show, status: :ok, location: @program_educational_objective }
      else
        format.html { render :edit }
        format.json { render json: @program_educational_objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /program_educational_objectives/1
  # DELETE /program_educational_objectives/1.json
  def destroy
    @program_educational_objective.destroy
    respond_to do |format|
      format.html { redirect_to program_educational_objectives_url, notice: 'Program educational objective was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program_educational_objective
      @program_educational_objective = ProgramEducationalObjective.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_educational_objective_params
      params.require(:program_educational_objective).permit(:accredidation_body, :title, :description, :year_added, :active, :correct_answers, :incorrect_answers, :temp_correct_answer, :temp_incorrect_answer)
    end
end
