class StudentLearningOutcomesController < ApplicationController
  before_action :set_student_learning_outcome, only: [:show, :edit, :update, :destroy]

  # GET /student_learning_outcomes
  # GET /student_learning_outcomes.json
  def index
    @student_learning_outcomes = StudentLearningOutcome.all
  end

  # GET /student_learning_outcomes/1
  # GET /student_learning_outcomes/1.json
  def show
  end

  # GET /student_learning_outcomes/new
  def new
    @student_learning_outcome = StudentLearningOutcome.new
  end

  # GET /student_learning_outcomes/1/edit
  def edit
  end

  # POST /student_learning_outcomes
  # POST /student_learning_outcomes.json
  def create
    @student_learning_outcome = StudentLearningOutcome.new(student_learning_outcome_params)

    respond_to do |format|
      if @student_learning_outcome.save
        format.html { redirect_to @student_learning_outcome, notice: 'Student learning outcome was successfully created.' }
        format.json { render :show, status: :created, location: @student_learning_outcome }
      else
        format.html { render :new }
        format.json { render json: @student_learning_outcome.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_learning_outcomes/1
  # PATCH/PUT /student_learning_outcomes/1.json
  def update
    respond_to do |format|
      if @student_learning_outcome.update(student_learning_outcome_params)
        format.html { redirect_to @student_learning_outcome, notice: 'Student learning outcome was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_learning_outcome }
      else
        format.html { render :edit }
        format.json { render json: @student_learning_outcome.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_learning_outcomes/1
  # DELETE /student_learning_outcomes/1.json
  def destroy
    @student_learning_outcome.destroy
    respond_to do |format|
      format.html { redirect_to student_learning_outcomes_url, notice: 'Student learning outcome was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_learning_outcome
      @student_learning_outcome = StudentLearningOutcome.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_learning_outcome_params
      params.require(:student_learning_outcome).permit(:accredidation_body, :title, :description, :year_added, :active, :correct_answers, :incorrect_answers, :temp_correct_answer, :temp_incorrect_answer)
    end
end
