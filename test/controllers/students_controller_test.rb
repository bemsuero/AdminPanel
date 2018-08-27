require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get first_name" do
    get students_first_name_url
    assert_response :success
  end

  test "should get last_name" do
    get students_last_name_url
    assert_response :success
  end

  test "should get education" do
    get students_education_url
    assert_response :success
  end

  test "should get birthdate:date" do
    get students_birthdate:date_url
    assert_response :success
  end

end
