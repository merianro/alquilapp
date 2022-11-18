require "application_system_test_case"

class AlquilersTest < ApplicationSystemTestCase
  setup do
    @alquiler = alquilers(:one)
  end

  test "visiting the index" do
    visit alquilers_url
    assert_selector "h1", text: "Alquilers"
  end

  test "should create alquiler" do
    visit alquilers_url
    click_on "New alquiler"

    click_on "Create Alquiler"

    assert_text "Alquiler was successfully created"
    click_on "Back"
  end

  test "should update Alquiler" do
    visit alquiler_url(@alquiler)
    click_on "Edit this alquiler", match: :first

    click_on "Update Alquiler"

    assert_text "Alquiler was successfully updated"
    click_on "Back"
  end

  test "should destroy Alquiler" do
    visit alquiler_url(@alquiler)
    click_on "Destroy this alquiler", match: :first

    assert_text "Alquiler was successfully destroyed"
  end
end
