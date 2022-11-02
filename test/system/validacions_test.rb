require "application_system_test_case"

class ValidacionsTest < ApplicationSystemTestCase
  setup do
    @validacion = validacions(:one)
  end

  test "visiting the index" do
    visit validacions_url
    assert_selector "h1", text: "Validacions"
  end

  test "should create validacion" do
    visit validacions_url
    click_on "New validacion"

    click_on "Create Validacion"

    assert_text "Validacion was successfully created"
    click_on "Back"
  end

  test "should update Validacion" do
    visit validacion_url(@validacion)
    click_on "Edit this validacion", match: :first

    click_on "Update Validacion"

    assert_text "Validacion was successfully updated"
    click_on "Back"
  end

  test "should destroy Validacion" do
    visit validacion_url(@validacion)
    click_on "Destroy this validacion", match: :first

    assert_text "Validacion was successfully destroyed"
  end
end
