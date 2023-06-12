require "application_system_test_case"

class PlantSittingsTest < ApplicationSystemTestCase
  setup do
    @plant_sitting = plant_sittings(:one)
  end

  test "visiting the index" do
    visit plant_sittings_url
    assert_selector "h1", text: "Plant sittings"
  end

  test "should create plant sitting" do
    visit plant_sittings_url
    click_on "New plant sitting"

    fill_in "Kept plant", with: @plant_sitting.kept_plant_id
    fill_in "User", with: @plant_sitting.user_id
    click_on "Create Plant sitting"

    assert_text "Plant sitting was successfully created"
    click_on "Back"
  end

  test "should update Plant sitting" do
    visit plant_sitting_url(@plant_sitting)
    click_on "Edit this plant sitting", match: :first

    fill_in "Kept plant", with: @plant_sitting.kept_plant_id
    fill_in "User", with: @plant_sitting.user_id
    click_on "Update Plant sitting"

    assert_text "Plant sitting was successfully updated"
    click_on "Back"
  end

  test "should destroy Plant sitting" do
    visit plant_sitting_url(@plant_sitting)
    click_on "Destroy this plant sitting", match: :first

    assert_text "Plant sitting was successfully destroyed"
  end
end
