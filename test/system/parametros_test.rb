require "application_system_test_case"

class ParametrosTest < ApplicationSystemTestCase
  setup do
    @parametro = parametros(:one)
  end

  test "visiting the index" do
    visit parametros_url
    assert_selector "h1", text: "Parametros"
  end

  test "should create parametro" do
    visit parametros_url
    click_on "New parametro"

    click_on "Create Parametro"

    assert_text "Parametro was successfully created"
    click_on "Back"
  end

  test "should update Parametro" do
    visit parametro_url(@parametro)
    click_on "Edit this parametro", match: :first

    click_on "Update Parametro"

    assert_text "Parametro was successfully updated"
    click_on "Back"
  end

  test "should destroy Parametro" do
    visit parametro_url(@parametro)
    click_on "Destroy this parametro", match: :first

    assert_text "Parametro was successfully destroyed"
  end
end
