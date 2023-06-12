require "application_system_test_case"

class OwnedPlantsTest < ApplicationSystemTestCase
  setup do
    @owned_plant = owned_plants(:one)
  end

  test "visiting the index" do
    visit owned_plants_url
    assert_selector "h1", text: "Owned plants"
  end

  test "should create owned plant" do
    visit owned_plants_url
    click_on "New owned plant"

    fill_in "Plant", with: @owned_plant.plant_id
    fill_in "Quantity", with: @owned_plant.quantity
    fill_in "User", with: @owned_plant.user_id
    click_on "Create Owned plant"

    assert_text "Owned plant was successfully created"
    click_on "Back"
  end

  test "should update Owned plant" do
    visit owned_plant_url(@owned_plant)
    click_on "Edit this owned plant", match: :first

    fill_in "Plant", with: @owned_plant.plant_id
    fill_in "Quantity", with: @owned_plant.quantity
    fill_in "User", with: @owned_plant.user_id
    click_on "Update Owned plant"

    assert_text "Owned plant was successfully updated"
    click_on "Back"
  end

  test "should destroy Owned plant" do
    visit owned_plant_url(@owned_plant)
    click_on "Destroy this owned plant", match: :first

    assert_text "Owned plant was successfully destroyed"
  end
end
