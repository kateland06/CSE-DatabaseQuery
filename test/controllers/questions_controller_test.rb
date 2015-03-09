require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  setup do
    @question = questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      post :create, question: { active: @question.active, answer: @question.answer, correct_answers: @question.correct_answers, creator: @question.creator, date_created: @question.date_created, incorrect_answers: @question.incorrect_answers, question_text: @question.question_text, temp_correct_answer: @question.temp_correct_answer, temp_incorrect_answer: @question.temp_incorrect_answer }
    end

    assert_redirected_to question_path(assigns(:question))
  end

  test "should show question" do
    get :show, id: @question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question
    assert_response :success
  end

  test "should update question" do
    patch :update, id: @question, question: { active: @question.active, answer: @question.answer, correct_answers: @question.correct_answers, creator: @question.creator, date_created: @question.date_created, incorrect_answers: @question.incorrect_answers, question_text: @question.question_text, temp_correct_answer: @question.temp_correct_answer, temp_incorrect_answer: @question.temp_incorrect_answer }
    assert_redirected_to question_path(assigns(:question))
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete :destroy, id: @question
    end

    assert_redirected_to questions_path
  end
end
