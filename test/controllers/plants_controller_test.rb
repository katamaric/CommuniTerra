require "test_helper"

class PlantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plant = plants(:one)
  end

  test "should get index" do
    get plants_url
    assert_response :success
  end

  test "should get new" do
    get new_plant_url
    assert_response :success
  end

  test "should create plant" do
    assert_difference("Plant.count") do
      post plants_url, params: { plant: { cold_resistance_description: @plant.cold_resistance_description, cold_resistance_level: @plant.cold_resistance_level, common_name: @plant.common_name, density: @plant.density, description: @plant.description, exposure_description: @plant.exposure_description, exposure_level: @plant.exposure_level, flowering: @plant.flowering, foliage: @plant.foliage, harvest: @plant.harvest, latin_name: @plant.latin_name, maintenance_description: @plant.maintenance_description, maintenance_level: @plant.maintenance_level, mature_height: @plant.mature_height, mature_width: @plant.mature_width, planting: @plant.planting, pruning: @plant.pruning, specie: @plant.specie, vegetation: @plant.vegetation, water_requirement_description: @plant.water_requirement_description, water_requirement_level: @plant.water_requirement_level } }
    end

    assert_redirected_to plant_url(Plant.last)
  end

  test "should show plant" do
    get plant_url(@plant)
    assert_response :success
  end

  test "should get edit" do
    get edit_plant_url(@plant)
    assert_response :success
  end

  test "should update plant" do
    patch plant_url(@plant), params: { plant: { cold_resistance_description: @plant.cold_resistance_description, cold_resistance_level: @plant.cold_resistance_level, common_name: @plant.common_name, density: @plant.density, description: @plant.description, exposure_description: @plant.exposure_description, exposure_level: @plant.exposure_level, flowering: @plant.flowering, foliage: @plant.foliage, harvest: @plant.harvest, latin_name: @plant.latin_name, maintenance_description: @plant.maintenance_description, maintenance_level: @plant.maintenance_level, mature_height: @plant.mature_height, mature_width: @plant.mature_width, planting: @plant.planting, pruning: @plant.pruning, specie: @plant.specie, vegetation: @plant.vegetation, water_requirement_description: @plant.water_requirement_description, water_requirement_level: @plant.water_requirement_level } }
    assert_redirected_to plant_url(@plant)
  end

  test "should destroy plant" do
    assert_difference("Plant.count", -1) do
      delete plant_url(@plant)
    end

    assert_redirected_to plants_url
  end
end
