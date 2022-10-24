require "application_system_test_case"

class SusTest < ApplicationSystemTestCase
  setup do
    @su = sus(:one)
  end

  test "visiting the index" do
    visit sus_url
    assert_selector "h1", text: "Sus"
  end

  test "should create su" do
    visit sus_url
    click_on "New su"

    fill_in "Dni", with: @su.dni
    fill_in "Name", with: @su.name
    fill_in "Surname", with: @su.surname
    click_on "Create Su"

    assert_text "Su was successfully created"
    click_on "Back"
  end

  test "should update Su" do
    visit su_url(@su)
    click_on "Edit this su", match: :first

    fill_in "Dni", with: @su.dni
    fill_in "Name", with: @su.name
    fill_in "Surname", with: @su.surname
    click_on "Update Su"

    assert_text "Su was successfully updated"
    click_on "Back"
  end

  test "should destroy Su" do
    visit su_url(@su)
    click_on "Destroy this su", match: :first

    assert_text "Su was successfully destroyed"
  end
end
