require 'test_helper'

class PeoCoveredBySlosControllerTest < ActionController::TestCase
  setup do
    @peo_covered_by_slo = peo_covered_by_slos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:peo_covered_by_slos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create peo_covered_by_slo" do
    assert_difference('PeoCoveredBySlo.count') do
      post :create, peo_covered_by_slo: { program_educational_objective_id: @peo_covered_by_slo.program_educational_objective_id, student_learning_outcome_id: @peo_covered_by_slo.student_learning_outcome_id }
    end

    assert_redirected_to peo_covered_by_slo_path(assigns(:peo_covered_by_slo))
  end

  test "should show peo_covered_by_slo" do
    get :show, id: @peo_covered_by_slo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @peo_covered_by_slo
    assert_response :success
  end

  test "should update peo_covered_by_slo" do
    patch :update, id: @peo_covered_by_slo, peo_covered_by_slo: { program_educational_objective_id: @peo_covered_by_slo.program_educational_objective_id, student_learning_outcome_id: @peo_covered_by_slo.student_learning_outcome_id }
    assert_redirected_to peo_covered_by_slo_path(assigns(:peo_covered_by_slo))
  end

  test "should destroy peo_covered_by_slo" do
    assert_difference('PeoCoveredBySlo.count', -1) do
      delete :destroy, id: @peo_covered_by_slo
    end

    assert_redirected_to peo_covered_by_slos_path
  end
end
