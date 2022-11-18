require "test_helper"

class SistemaReportesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sistema_reporte = sistema_reportes(:one)
  end

  test "should get index" do
    get sistema_reportes_url
    assert_response :success
  end

  test "should get new" do
    get new_sistema_reporte_url
    assert_response :success
  end

  test "should create sistema_reporte" do
    assert_difference("SistemaReporte.count") do
      post sistema_reportes_url, params: { sistema_reporte: {  } }
    end

    assert_redirected_to sistema_reporte_url(SistemaReporte.last)
  end

  test "should show sistema_reporte" do
    get sistema_reporte_url(@sistema_reporte)
    assert_response :success
  end

  test "should get edit" do
    get edit_sistema_reporte_url(@sistema_reporte)
    assert_response :success
  end

  test "should update sistema_reporte" do
    patch sistema_reporte_url(@sistema_reporte), params: { sistema_reporte: {  } }
    assert_redirected_to sistema_reporte_url(@sistema_reporte)
  end

  test "should destroy sistema_reporte" do
    assert_difference("SistemaReporte.count", -1) do
      delete sistema_reporte_url(@sistema_reporte)
    end

    assert_redirected_to sistema_reportes_url
  end
end
