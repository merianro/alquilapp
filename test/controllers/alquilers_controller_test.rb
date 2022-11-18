require "test_helper"

class AlquilersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alquiler = alquilers(:one)
  end

  test "should get index" do
    get alquilers_url
    assert_response :success
  end

  test "should get new" do
    get new_alquiler_url
    assert_response :success
  end

  test "should create alquiler" do
    assert_difference("Alquiler.count") do
      post alquilers_url, params: { alquiler: {  } }
    end

    assert_redirected_to alquiler_url(Alquiler.last)
  end

  test "should show alquiler" do
    get alquiler_url(@alquiler)
    assert_response :success
  end

  test "should get edit" do
    get edit_alquiler_url(@alquiler)
    assert_response :success
  end

  test "should update alquiler" do
    patch alquiler_url(@alquiler), params: { alquiler: {  } }
    assert_redirected_to alquiler_url(@alquiler)
  end

  test "should destroy alquiler" do
    assert_difference("Alquiler.count", -1) do
      delete alquiler_url(@alquiler)
    end

    assert_redirected_to alquilers_url
  end
end
