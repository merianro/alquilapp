require "test_helper"

class MpWebhooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mp_webhook = mp_webhooks(:one)
  end

  test "should get index" do
    get mp_webhooks_url
    assert_response :success
  end

  test "should get new" do
    get new_mp_webhook_url
    assert_response :success
  end

  test "should create mp_webhook" do
    assert_difference("MpWebhook.count") do
      post mp_webhooks_url, params: { mp_webhook: {  } }
    end

    assert_redirected_to mp_webhook_url(MpWebhook.last)
  end

  test "should show mp_webhook" do
    get mp_webhook_url(@mp_webhook)
    assert_response :success
  end

  test "should get edit" do
    get edit_mp_webhook_url(@mp_webhook)
    assert_response :success
  end

  test "should update mp_webhook" do
    patch mp_webhook_url(@mp_webhook), params: { mp_webhook: {  } }
    assert_redirected_to mp_webhook_url(@mp_webhook)
  end

  test "should destroy mp_webhook" do
    assert_difference("MpWebhook.count", -1) do
      delete mp_webhook_url(@mp_webhook)
    end

    assert_redirected_to mp_webhooks_url
  end
end
