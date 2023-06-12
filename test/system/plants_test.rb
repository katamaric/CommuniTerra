require "application_system_test_case"

class PlantsTest < ApplicationSystemTestCase
  setup do
    @plant = plants(:one)
  end

  test "visiting the index" do
    visit plants_url
    assert_selector "h1", text: "Plants"
  end

  test "should create plant" do
    visit plants_url
    click_on "New plant"

    fill_in "Cold resistance description", with: @plant.cold_resistance_description
    fill_in "Cold resistance level", with: @plant.cold_resistance_level
    fill_in "Common name", with: @plant.common_name
    fill_in "Density", with: @plant.density
    fill_in "Description", with: @plant.description
    fill_in "Exposure description", with: @plant.exposure_description
    fill_in "Exposure level", with: @plant.exposure_level
    fill_in "Flowering", with: @plant.flowering
    fill_in "Foliage", with: @plant.foliage
    fill_in "Harvest", with: @plant.harvest
    fill_in "Latin name", with: @plant.latin_name
    fill_in "Maintenance description", with: @plant.maintenance_description
    fill_in "Maintenance level", with: @plant.maintenance_level
    fill_in "Mature height", with: @plant.mature_height
    fill_in "Mature width", with: @plant.mature_width
    fill_in "Planting", with: @plant.planting
    fill_in "Pruning", with: @plant.pruning
    fill_in "Specie", with: @plant.specie
    fill_in "Vegetation", with: @plant.vegetation
    fill_in "Water requirement description", with: @plant.water_requirement_description
    fill_in "Water requirement level", with: @plant.water_requirement_level
    click_on "Create Plant"

    assert_text "Plant was successfully created"
    click_on "Back"
  end

  test "should update Plant" do
    visit plant_url(@plant)
    click_on "Edit this plant", match: :first

    fill_in "Cold resistance description", with: @plant.cold_resistance_description
    fill_in "Cold resistance level", with: @plant.cold_resistance_level
    fill_in "Common name", with: @plant.common_name
    fill_in "Density", with: @plant.density
    fill_in "Description", with: @plant.description
    fill_in "Exposure description", with: @plant.exposure_description
    fill_in "Exposure level", with: @plant.exposure_level
    fill_in "Flowering", with: @plant.flowering
    fill_in "Foliage", with: @plant.foliage
    fill_in "Harvest", with: @plant.harvest
    fill_in "Latin name", with: @plant.latin_name
    fill_in "Maintenance description", with: @plant.maintenance_description
    fill_in "Maintenance level", with: @plant.maintenance_level
    fill_in "Mature height", with: @plant.mature_height
    fill_in "Mature width", with: @plant.mature_width
    fill_in "Planting", with: @plant.planting
    fill_in "Pruning", with: @plant.pruning
    fill_in "Specie", with: @plant.specie
    fill_in "Vegetation", with: @plant.vegetation
    fill_in "Water requirement description", with: @plant.water_requirement_description
    fill_in "Water requirement level", with: @plant.water_requirement_level
    click_on "Update Plant"

    assert_text "Plant was successfully updated"
    click_on "Back"
  end

  test "should destroy Plant" do
    visit plant_url(@plant)
    click_on "Destroy this plant", match: :first

    assert_text "Plant was successfully destroyed"
  end
end
