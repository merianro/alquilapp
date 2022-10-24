require "test_helper"

class SusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @su = sus(:one)
  end

  test "should get index" do
    get sus_url
    assert_response :success
  end

  test "should get new" do
    get new_su_url
    assert_response :success
  end

  test "should create su" do
    assert_difference("Su.count") do
      post sus_url, params: { su: { dni: @su.dni, name: @su.name, surname: @su.surname } }
    end

    assert_redirected_to su_url(Su.last)
  end

  test "should show su" do
    get su_url(@su)
    assert_response :success
  end

  test "should get edit" do
    get edit_su_url(@su)
    assert_response :success
  end

  test "should update su" do
    patch su_url(@su), params: { su: { dni: @su.dni, name: @su.name, surname: @su.surname } }
    assert_redirected_to su_url(@su)
  end

  test "should destroy su" do
    assert_difference("Su.count", -1) do
      delete su_url(@su)
    end

    assert_redirected_to sus_url
  end
end
