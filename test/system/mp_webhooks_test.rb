require "application_system_test_case"

class MpWebhooksTest < ApplicationSystemTestCase
  setup do
    @mp_webhook = mp_webhooks(:one)
  end

  test "visiting the index" do
    visit mp_webhooks_url
    assert_selector "h1", text: "Mp webhooks"
  end

  test "should create mp webhook" do
    visit mp_webhooks_url
    click_on "New mp webhook"

    click_on "Create Mp webhook"

    assert_text "Mp webhook was successfully created"
    click_on "Back"
  end

  test "should update Mp webhook" do
    visit mp_webhook_url(@mp_webhook)
    click_on "Edit this mp webhook", match: :first

    click_on "Update Mp webhook"

    assert_text "Mp webhook was successfully updated"
    click_on "Back"
  end

  test "should destroy Mp webhook" do
    visit mp_webhook_url(@mp_webhook)
    click_on "Destroy this mp webhook", match: :first

    assert_text "Mp webhook was successfully destroyed"
  end
end
