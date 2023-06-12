require "test_helper"

class AllotmentUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @allotment_user = allotment_users(:one)
  end

  test "should get index" do
    get allotment_users_url
    assert_response :success
  end

  test "should get new" do
    get new_allotment_user_url
    assert_response :success
  end

  test "should create allotment_user" do
    assert_difference("AllotmentUser.count") do
      post allotment_users_url, params: { allotment_user: { admin_id: @allotment_user.admin_id, allotment_id: @allotment_user.allotment_id, member_id: @allotment_user.member_id } }
    end

    assert_redirected_to allotment_user_url(AllotmentUser.last)
  end

  test "should show allotment_user" do
    get allotment_user_url(@allotment_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_allotment_user_url(@allotment_user)
    assert_response :success
  end

  test "should update allotment_user" do
    patch allotment_user_url(@allotment_user), params: { allotment_user: { admin_id: @allotment_user.admin_id, allotment_id: @allotment_user.allotment_id, member_id: @allotment_user.member_id } }
    assert_redirected_to allotment_user_url(@allotment_user)
  end

  test "should destroy allotment_user" do
    assert_difference("AllotmentUser.count", -1) do
      delete allotment_user_url(@allotment_user)
    end

    assert_redirected_to allotment_users_url
  end
end
