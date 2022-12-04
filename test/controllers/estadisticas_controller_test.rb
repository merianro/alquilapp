require "test_helper"

class EstadisticasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estadistica = estadisticas(:one)
  end

  test "should get index" do
    get estadisticas_url
    assert_response :success
  end

  test "should get new" do
    get new_estadistica_url
    assert_response :success
  end

  test "should create estadistica" do
    assert_difference("Estadistica.count") do
      post estadisticas_url, params: { estadistica: {  } }
    end

    assert_redirected_to estadistica_url(Estadistica.last)
  end

  test "should show estadistica" do
    get estadistica_url(@estadistica)
    assert_response :success
  end

  test "should get edit" do
    get edit_estadistica_url(@estadistica)
    assert_response :success
  end

  test "should update estadistica" do
    patch estadistica_url(@estadistica), params: { estadistica: {  } }
    assert_redirected_to estadistica_url(@estadistica)
  end

  test "should destroy estadistica" do
    assert_difference("Estadistica.count", -1) do
      delete estadistica_url(@estadistica)
    end

    assert_redirected_to estadisticas_url
  end
end
