require 'test_helper'

class KnowledgeTopicsControllerTest < ActionController::TestCase
  setup do
    @knowledge_topic = knowledge_topics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:knowledge_topics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create knowledge_topic" do
    assert_difference('KnowledgeTopic.count') do
      post :create, knowledge_topic: { active: @knowledge_topic.active, correct_answers: @knowledge_topic.correct_answers, incorrect_answers: @knowledge_topic.incorrect_answers, knowledge_area: @knowledge_topic.knowledge_area, knowledge_topic: @knowledge_topic.knowledge_topic, knowledge_unit: @knowledge_topic.knowledge_unit, temp_correct_answer: @knowledge_topic.temp_correct_answer, temp_incorrect_answer: @knowledge_topic.temp_incorrect_answer, year_added: @knowledge_topic.year_added }
    end

    assert_redirected_to knowledge_topic_path(assigns(:knowledge_topic))
  end

  test "should show knowledge_topic" do
    get :show, id: @knowledge_topic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @knowledge_topic
    assert_response :success
  end

  test "should update knowledge_topic" do
    patch :update, id: @knowledge_topic, knowledge_topic: { active: @knowledge_topic.active, correct_answers: @knowledge_topic.correct_answers, incorrect_answers: @knowledge_topic.incorrect_answers, knowledge_area: @knowledge_topic.knowledge_area, knowledge_topic: @knowledge_topic.knowledge_topic, knowledge_unit: @knowledge_topic.knowledge_unit, temp_correct_answer: @knowledge_topic.temp_correct_answer, temp_incorrect_answer: @knowledge_topic.temp_incorrect_answer, year_added: @knowledge_topic.year_added }
    assert_redirected_to knowledge_topic_path(assigns(:knowledge_topic))
  end

  test "should destroy knowledge_topic" do
    assert_difference('KnowledgeTopic.count', -1) do
      delete :destroy, id: @knowledge_topic
    end

    assert_redirected_to knowledge_topics_path
  end
end
