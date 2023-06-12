require "test_helper"

class OwnedPlantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @owned_plant = owned_plants(:one)
  end

  test "should get index" do
    get owned_plants_url
    assert_response :success
  end

  test "should get new" do
    get new_owned_plant_url
    assert_response :success
  end

  test "should create owned_plant" do
    assert_difference("OwnedPlant.count") do
      post owned_plants_url, params: { owned_plant: { plant_id: @owned_plant.plant_id, quantity: @owned_plant.quantity, user_id: @owned_plant.user_id } }
    end

    assert_redirected_to owned_plant_url(OwnedPlant.last)
  end

  test "should show owned_plant" do
    get owned_plant_url(@owned_plant)
    assert_response :success
  end

  test "should get edit" do
    get edit_owned_plant_url(@owned_plant)
    assert_response :success
  end

  test "should update owned_plant" do
    patch owned_plant_url(@owned_plant), params: { owned_plant: { plant_id: @owned_plant.plant_id, quantity: @owned_plant.quantity, user_id: @owned_plant.user_id } }
    assert_redirected_to owned_plant_url(@owned_plant)
  end

  test "should destroy owned_plant" do
    assert_difference("OwnedPlant.count", -1) do
      delete owned_plant_url(@owned_plant)
    end

    assert_redirected_to owned_plants_url
  end
end
