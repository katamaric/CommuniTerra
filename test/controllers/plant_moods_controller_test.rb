require "test_helper"

class PlantMoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plant_mood = plant_moods(:one)
  end

  test "should get index" do
    get plant_moods_url
    assert_response :success
  end

  test "should get new" do
    get new_plant_mood_url
    assert_response :success
  end

  test "should create plant_mood" do
    assert_difference("PlantMood.count") do
      post plant_moods_url, params: { plant_mood: { plant_mood: @plant_mood.plant_mood } }
    end

    assert_redirected_to plant_mood_url(PlantMood.last)
  end

  test "should show plant_mood" do
    get plant_mood_url(@plant_mood)
    assert_response :success
  end

  test "should get edit" do
    get edit_plant_mood_url(@plant_mood)
    assert_response :success
  end

  test "should update plant_mood" do
    patch plant_mood_url(@plant_mood), params: { plant_mood: { plant_mood: @plant_mood.plant_mood } }
    assert_redirected_to plant_mood_url(@plant_mood)
  end

  test "should destroy plant_mood" do
    assert_difference("PlantMood.count", -1) do
      delete plant_mood_url(@plant_mood)
    end

    assert_redirected_to plant_moods_url
  end
end
