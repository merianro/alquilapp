require "application_system_test_case"

class CarsTest < ApplicationSystemTestCase
  setup do
    @car = cars(:one)
  end

  test "visiting the index" do
    visit cars_url
    assert_selector "h1", text: "Cars"
  end

  test "should create car" do
    visit cars_url
    click_on "New car"

    fill_in "Ano", with: @car.ano
    fill_in "Capacidad", with: @car.capacidad
    fill_in "Color", with: @car.color
    fill_in "Marca", with: @car.marca
    fill_in "Modelo", with: @car.modelo
    fill_in "Transmision", with: @car.transmision
    click_on "Create Car"

    assert_text "Car was successfully created"
    click_on "Back"
  end

  test "should update Car" do
    visit car_url(@car)
    click_on "Edit this car", match: :first

    fill_in "Ano", with: @car.ano
    fill_in "Capacidad", with: @car.capacidad
    fill_in "Color", with: @car.color
    fill_in "Marca", with: @car.marca
    fill_in "Modelo", with: @car.modelo
    fill_in "Transmision", with: @car.transmision
    click_on "Update Car"

    assert_text "Car was successfully updated"
    click_on "Back"
  end

  test "should destroy Car" do
    visit car_url(@car)
    click_on "Destroy this car", match: :first

    assert_text "Car was successfully destroyed"
  end
end
