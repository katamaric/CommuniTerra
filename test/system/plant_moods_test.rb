require "application_system_test_case"

class PlantMoodsTest < ApplicationSystemTestCase
  setup do
    @plant_mood = plant_moods(:one)
  end

  test "visiting the index" do
    visit plant_moods_url
    assert_selector "h1", text: "Plant moods"
  end

  test "should create plant mood" do
    visit plant_moods_url
    click_on "New plant mood"

    fill_in "Plant mood", with: @plant_mood.plant_mood
    click_on "Create Plant mood"

    assert_text "Plant mood was successfully created"
    click_on "Back"
  end

  test "should update Plant mood" do
    visit plant_mood_url(@plant_mood)
    click_on "Edit this plant mood", match: :first

    fill_in "Plant mood", with: @plant_mood.plant_mood
    click_on "Update Plant mood"

    assert_text "Plant mood was successfully updated"
    click_on "Back"
  end

  test "should destroy Plant mood" do
    visit plant_mood_url(@plant_mood)
    click_on "Destroy this plant mood", match: :first

    assert_text "Plant mood was successfully destroyed"
  end
end
