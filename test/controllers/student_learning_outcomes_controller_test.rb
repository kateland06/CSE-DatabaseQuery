require 'test_helper'

class StudentLearningOutcomesControllerTest < ActionController::TestCase
  setup do
    @student_learning_outcome = student_learning_outcomes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_learning_outcomes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_learning_outcome" do
    assert_difference('StudentLearningOutcome.count') do
      post :create, student_learning_outcome: { accredidation_body: @student_learning_outcome.accredidation_body, active: @student_learning_outcome.active, correct_answers: @student_learning_outcome.correct_answers, description: @student_learning_outcome.description, incorrect_answers: @student_learning_outcome.incorrect_answers, temp_correct_answer: @student_learning_outcome.temp_correct_answer, temp_incorrect_answer: @student_learning_outcome.temp_incorrect_answer, title: @student_learning_outcome.title, year_added: @student_learning_outcome.year_added }
    end

    assert_redirected_to student_learning_outcome_path(assigns(:student_learning_outcome))
  end

  test "should show student_learning_outcome" do
    get :show, id: @student_learning_outcome
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_learning_outcome
    assert_response :success
  end

  test "should update student_learning_outcome" do
    patch :update, id: @student_learning_outcome, student_learning_outcome: { accredidation_body: @student_learning_outcome.accredidation_body, active: @student_learning_outcome.active, correct_answers: @student_learning_outcome.correct_answers, description: @student_learning_outcome.description, incorrect_answers: @student_learning_outcome.incorrect_answers, temp_correct_answer: @student_learning_outcome.temp_correct_answer, temp_incorrect_answer: @student_learning_outcome.temp_incorrect_answer, title: @student_learning_outcome.title, year_added: @student_learning_outcome.year_added }
    assert_redirected_to student_learning_outcome_path(assigns(:student_learning_outcome))
  end

  test "should destroy student_learning_outcome" do
    assert_difference('StudentLearningOutcome.count', -1) do
      delete :destroy, id: @student_learning_outcome
    end

    assert_redirected_to student_learning_outcomes_path
  end
end
