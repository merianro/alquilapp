require "application_system_test_case"

class SistemaReportesTest < ApplicationSystemTestCase
  setup do
    @sistema_reporte = sistema_reportes(:one)
  end

  test "visiting the index" do
    visit sistema_reportes_url
    assert_selector "h1", text: "Sistema reportes"
  end

  test "should create sistema reporte" do
    visit sistema_reportes_url
    click_on "New sistema reporte"

    click_on "Create Sistema reporte"

    assert_text "Sistema reporte was successfully created"
    click_on "Back"
  end

  test "should update Sistema reporte" do
    visit sistema_reporte_url(@sistema_reporte)
    click_on "Edit this sistema reporte", match: :first

    click_on "Update Sistema reporte"

    assert_text "Sistema reporte was successfully updated"
    click_on "Back"
  end

  test "should destroy Sistema reporte" do
    visit sistema_reporte_url(@sistema_reporte)
    click_on "Destroy this sistema reporte", match: :first

    assert_text "Sistema reporte was successfully destroyed"
  end
end
