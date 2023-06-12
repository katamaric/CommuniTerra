require "application_system_test_case"

class KeptPlantsTest < ApplicationSystemTestCase
  setup do
    @kept_plant = kept_plants(:one)
  end

  test "visiting the index" do
    visit kept_plants_url
    assert_selector "h1", text: "Kept plants"
  end

  test "should create kept plant" do
    visit kept_plants_url
    click_on "New kept plant"

    fill_in "Owned plant", with: @kept_plant.owned_plant_id
    fill_in "Quantity", with: @kept_plant.quantity
    fill_in "User", with: @kept_plant.user_id
    click_on "Create Kept plant"

    assert_text "Kept plant was successfully created"
    click_on "Back"
  end

  test "should update Kept plant" do
    visit kept_plant_url(@kept_plant)
    click_on "Edit this kept plant", match: :first

    fill_in "Owned plant", with: @kept_plant.owned_plant_id
    fill_in "Quantity", with: @kept_plant.quantity
    fill_in "User", with: @kept_plant.user_id
    click_on "Update Kept plant"

    assert_text "Kept plant was successfully updated"
    click_on "Back"
  end

  test "should destroy Kept plant" do
    visit kept_plant_url(@kept_plant)
    click_on "Destroy this kept plant", match: :first

    assert_text "Kept plant was successfully destroyed"
  end
end
