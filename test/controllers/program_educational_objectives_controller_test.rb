require 'test_helper'

class ProgramEducationalObjectivesControllerTest < ActionController::TestCase
  setup do
    @program_educational_objective = program_educational_objectives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:program_educational_objectives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create program_educational_objective" do
    assert_difference('ProgramEducationalObjective.count') do
      post :create, program_educational_objective: { accredidation_body: @program_educational_objective.accredidation_body, active: @program_educational_objective.active, correct_answers: @program_educational_objective.correct_answers, description: @program_educational_objective.description, incorrect_answers: @program_educational_objective.incorrect_answers, temp_correct_answer: @program_educational_objective.temp_correct_answer, temp_incorrect_answer: @program_educational_objective.temp_incorrect_answer, title: @program_educational_objective.title, year_added: @program_educational_objective.year_added }
    end

    assert_redirected_to program_educational_objective_path(assigns(:program_educational_objective))
  end

  test "should show program_educational_objective" do
    get :show, id: @program_educational_objective
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @program_educational_objective
    assert_response :success
  end

  test "should update program_educational_objective" do
    patch :update, id: @program_educational_objective, program_educational_objective: { accredidation_body: @program_educational_objective.accredidation_body, active: @program_educational_objective.active, correct_answers: @program_educational_objective.correct_answers, description: @program_educational_objective.description, incorrect_answers: @program_educational_objective.incorrect_answers, temp_correct_answer: @program_educational_objective.temp_correct_answer, temp_incorrect_answer: @program_educational_objective.temp_incorrect_answer, title: @program_educational_objective.title, year_added: @program_educational_objective.year_added }
    assert_redirected_to program_educational_objective_path(assigns(:program_educational_objective))
  end

  test "should destroy program_educational_objective" do
    assert_difference('ProgramEducationalObjective.count', -1) do
      delete :destroy, id: @program_educational_objective
    end

    assert_redirected_to program_educational_objectives_path
  end
end
