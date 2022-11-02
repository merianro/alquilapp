require "application_system_test_case"

class ValidationsTest < ApplicationSystemTestCase
  setup do
    @validation = validations(:one)
  end

  test "visiting the index" do
    visit validations_url
    assert_selector "h1", text: "Validations"
  end

  test "should create validation" do
    visit validations_url
    click_on "New validation"

    fill_in "Su", with: @validation.su_id
    click_on "Create Validation"

    assert_text "Validation was successfully created"
    click_on "Back"
  end

  test "should update Validation" do
    visit validation_url(@validation)
    click_on "Edit this validation", match: :first

    fill_in "Su", with: @validation.su_id
    click_on "Update Validation"

    assert_text "Validation was successfully updated"
    click_on "Back"
  end

  test "should destroy Validation" do
    visit validation_url(@validation)
    click_on "Destroy this validation", match: :first

    assert_text "Validation was successfully destroyed"
  end
end
