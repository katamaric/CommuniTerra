require "test_helper"

class PlantSittingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plant_sitting = plant_sittings(:one)
  end

  test "should get index" do
    get plant_sittings_url
    assert_response :success
  end

  test "should get new" do
    get new_plant_sitting_url
    assert_response :success
  end

  test "should create plant_sitting" do
    assert_difference("PlantSitting.count") do
      post plant_sittings_url, params: { plant_sitting: { kept_plant_id: @plant_sitting.kept_plant_id, user_id: @plant_sitting.user_id } }
    end

    assert_redirected_to plant_sitting_url(PlantSitting.last)
  end

  test "should show plant_sitting" do
    get plant_sitting_url(@plant_sitting)
    assert_response :success
  end

  test "should get edit" do
    get edit_plant_sitting_url(@plant_sitting)
    assert_response :success
  end

  test "should update plant_sitting" do
    patch plant_sitting_url(@plant_sitting), params: { plant_sitting: { kept_plant_id: @plant_sitting.kept_plant_id, user_id: @plant_sitting.user_id } }
    assert_redirected_to plant_sitting_url(@plant_sitting)
  end

  test "should destroy plant_sitting" do
    assert_difference("PlantSitting.count", -1) do
      delete plant_sitting_url(@plant_sitting)
    end

    assert_redirected_to plant_sittings_url
  end
end
