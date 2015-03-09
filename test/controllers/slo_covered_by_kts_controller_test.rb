require 'test_helper'

class SloCoveredByKtsControllerTest < ActionController::TestCase
  setup do
    @slo_covered_by_kt = slo_covered_by_kts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:slo_covered_by_kts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create slo_covered_by_kt" do
    assert_difference('SloCoveredByKt.count') do
      post :create, slo_covered_by_kt: { knowledge_topic_id: @slo_covered_by_kt.knowledge_topic_id, student_learning_outcome_id: @slo_covered_by_kt.student_learning_outcome_id }
    end

    assert_redirected_to slo_covered_by_kt_path(assigns(:slo_covered_by_kt))
  end

  test "should show slo_covered_by_kt" do
    get :show, id: @slo_covered_by_kt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @slo_covered_by_kt
    assert_response :success
  end

  test "should update slo_covered_by_kt" do
    patch :update, id: @slo_covered_by_kt, slo_covered_by_kt: { knowledge_topic_id: @slo_covered_by_kt.knowledge_topic_id, student_learning_outcome_id: @slo_covered_by_kt.student_learning_outcome_id }
    assert_redirected_to slo_covered_by_kt_path(assigns(:slo_covered_by_kt))
  end

  test "should destroy slo_covered_by_kt" do
    assert_difference('SloCoveredByKt.count', -1) do
      delete :destroy, id: @slo_covered_by_kt
    end

    assert_redirected_to slo_covered_by_kts_path
  end
end
