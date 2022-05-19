require "test_helper"

class TutorCreationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tutor_creation = tutor_creations(:one)
  end

  test "should get index" do
    get tutor_creations_url
    assert_response :success
  end

  test "should get new" do
    get new_tutor_creation_url
    assert_response :success
  end

  test "should create tutor_creation" do
    assert_difference("TutorCreation.count") do
      post tutor_creations_url, params: { tutor_creation: { description: @tutor_creation.description, first_name: @tutor_creation.first_name, last_name: @tutor_creation.last_name, price: @tutor_creation.price, subject: @tutor_creation.subject, user_id: @tutor_creation.user_id } }
    end

    assert_redirected_to tutor_creation_url(TutorCreation.last)
  end

  test "should show tutor_creation" do
    get tutor_creation_url(@tutor_creation)
    assert_response :success
  end

  test "should get edit" do
    get edit_tutor_creation_url(@tutor_creation)
    assert_response :success
  end

  test "should update tutor_creation" do
    patch tutor_creation_url(@tutor_creation), params: { tutor_creation: { description: @tutor_creation.description, first_name: @tutor_creation.first_name, last_name: @tutor_creation.last_name, price: @tutor_creation.price, subject: @tutor_creation.subject, user_id: @tutor_creation.user_id } }
    assert_redirected_to tutor_creation_url(@tutor_creation)
  end

  test "should destroy tutor_creation" do
    assert_difference("TutorCreation.count", -1) do
      delete tutor_creation_url(@tutor_creation)
    end

    assert_redirected_to tutor_creations_url
  end
end
