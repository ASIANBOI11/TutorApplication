require "application_system_test_case"

class TutorCreationsTest < ApplicationSystemTestCase
  setup do
    @tutor_creation = tutor_creations(:one)
  end

  test "visiting the index" do
    visit tutor_creations_url
    assert_selector "h1", text: "Tutor creations"
  end

  test "should create tutor creation" do
    visit tutor_creations_url
    click_on "New tutor creation"

    fill_in "Description", with: @tutor_creation.description
    fill_in "First name", with: @tutor_creation.first_name
    fill_in "Last name", with: @tutor_creation.last_name
    fill_in "Price", with: @tutor_creation.price
    fill_in "Subject", with: @tutor_creation.subject
    fill_in "User", with: @tutor_creation.user_id
    click_on "Create Tutor creation"

    assert_text "Tutor creation was successfully created"
    click_on "Back"
  end

  test "should update Tutor creation" do
    visit tutor_creation_url(@tutor_creation)
    click_on "Edit this tutor creation", match: :first

    fill_in "Description", with: @tutor_creation.description
    fill_in "First name", with: @tutor_creation.first_name
    fill_in "Last name", with: @tutor_creation.last_name
    fill_in "Price", with: @tutor_creation.price
    fill_in "Subject", with: @tutor_creation.subject
    fill_in "User", with: @tutor_creation.user_id
    click_on "Update Tutor creation"

    assert_text "Tutor creation was successfully updated"
    click_on "Back"
  end

  test "should destroy Tutor creation" do
    visit tutor_creation_url(@tutor_creation)
    click_on "Destroy this tutor creation", match: :first

    assert_text "Tutor creation was successfully destroyed"
  end
end
