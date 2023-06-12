require "test_helper"

class KeptPlantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kept_plant = kept_plants(:one)
  end

  test "should get index" do
    get kept_plants_url
    assert_response :success
  end

  test "should get new" do
    get new_kept_plant_url
    assert_response :success
  end

  test "should create kept_plant" do
    assert_difference("KeptPlant.count") do
      post kept_plants_url, params: { kept_plant: { owned_plant_id: @kept_plant.owned_plant_id, quantity: @kept_plant.quantity, user_id: @kept_plant.user_id } }
    end

    assert_redirected_to kept_plant_url(KeptPlant.last)
  end

  test "should show kept_plant" do
    get kept_plant_url(@kept_plant)
    assert_response :success
  end

  test "should get edit" do
    get edit_kept_plant_url(@kept_plant)
    assert_response :success
  end

  test "should update kept_plant" do
    patch kept_plant_url(@kept_plant), params: { kept_plant: { owned_plant_id: @kept_plant.owned_plant_id, quantity: @kept_plant.quantity, user_id: @kept_plant.user_id } }
    assert_redirected_to kept_plant_url(@kept_plant)
  end

  test "should destroy kept_plant" do
    assert_difference("KeptPlant.count", -1) do
      delete kept_plant_url(@kept_plant)
    end

    assert_redirected_to kept_plants_url
  end
end
