require 'test_helper'

class SectionsControllerTest < ActionController::TestCase
  setup do
    @section = sections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create section" do
    assert_difference('Section.count') do
      post :create, section: { academic_progress: @section.academic_progress, course: @section.course, course_registration_number: @section.course_registration_number, faculty: @section.faculty, grade: @section.grade, quiz_score: @section.quiz_score, section: @section.section, semester: @section.semester, student_id: @section.student_id, year_offered: @section.year_offered }
    end

    assert_redirected_to section_path(assigns(:section))
  end

  test "should show section" do
    get :show, id: @section
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @section
    assert_response :success
  end

  test "should update section" do
    patch :update, id: @section, section: { academic_progress: @section.academic_progress, course: @section.course, course_registration_number: @section.course_registration_number, faculty: @section.faculty, grade: @section.grade, quiz_score: @section.quiz_score, section: @section.section, semester: @section.semester, student_id: @section.student_id, year_offered: @section.year_offered }
    assert_redirected_to section_path(assigns(:section))
  end

  test "should destroy section" do
    assert_difference('Section.count', -1) do
      delete :destroy, id: @section
    end

    assert_redirected_to sections_path
  end
end
