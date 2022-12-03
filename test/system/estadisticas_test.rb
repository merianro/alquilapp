require "application_system_test_case"

class EstadisticasTest < ApplicationSystemTestCase
  setup do
    @estadistica = estadisticas(:one)
  end

  test "visiting the index" do
    visit estadisticas_url
    assert_selector "h1", text: "Estadisticas"
  end

  test "should create estadistica" do
    visit estadisticas_url
    click_on "New estadistica"

    click_on "Create Estadistica"

    assert_text "Estadistica was successfully created"
    click_on "Back"
  end

  test "should update Estadistica" do
    visit estadistica_url(@estadistica)
    click_on "Edit this estadistica", match: :first

    click_on "Update Estadistica"

    assert_text "Estadistica was successfully updated"
    click_on "Back"
  end

  test "should destroy Estadistica" do
    visit estadistica_url(@estadistica)
    click_on "Destroy this estadistica", match: :first

    assert_text "Estadistica was successfully destroyed"
  end
end
