require 'test_helper'

class ProgramOfStudiesControllerTest < ActionController::TestCase
  setup do
    @program_of_study = program_of_studies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:program_of_studies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create program_of_study" do
    assert_difference('ProgramOfStudy.count') do
      post :create, program_of_study: { program: @program_of_study.program, section_id: @program_of_study.section_id }
    end

    assert_redirected_to program_of_study_path(assigns(:program_of_study))
  end

  test "should show program_of_study" do
    get :show, id: @program_of_study
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @program_of_study
    assert_response :success
  end

  test "should update program_of_study" do
    patch :update, id: @program_of_study, program_of_study: { program: @program_of_study.program, section_id: @program_of_study.section_id }
    assert_redirected_to program_of_study_path(assigns(:program_of_study))
  end

  test "should destroy program_of_study" do
    assert_difference('ProgramOfStudy.count', -1) do
      delete :destroy, id: @program_of_study
    end

    assert_redirected_to program_of_studies_path
  end
end
