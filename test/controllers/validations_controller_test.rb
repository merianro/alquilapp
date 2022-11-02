require "test_helper"

class ValidationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @validation = validations(:one)
  end

  test "should get index" do
    get validations_url
    assert_response :success
  end

  test "should get new" do
    get new_validation_url
    assert_response :success
  end

  test "should create validation" do
    assert_difference("Validation.count") do
      post validations_url, params: { validation: { su_id: @validation.su_id } }
    end

    assert_redirected_to validation_url(Validation.last)
  end

  test "should show validation" do
    get validation_url(@validation)
    assert_response :success
  end

  test "should get edit" do
    get edit_validation_url(@validation)
    assert_response :success
  end

  test "should update validation" do
    patch validation_url(@validation), params: { validation: { su_id: @validation.su_id } }
    assert_redirected_to validation_url(@validation)
  end

  test "should destroy validation" do
    assert_difference("Validation.count", -1) do
      delete validation_url(@validation)
    end

    assert_redirected_to validations_url
  end
end
