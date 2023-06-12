require "application_system_test_case"

class AllotmentUsersTest < ApplicationSystemTestCase
  setup do
    @allotment_user = allotment_users(:one)
  end

  test "visiting the index" do
    visit allotment_users_url
    assert_selector "h1", text: "Allotment users"
  end

  test "should create allotment user" do
    visit allotment_users_url
    click_on "New allotment user"

    fill_in "Admin", with: @allotment_user.admin_id
    fill_in "Allotment", with: @allotment_user.allotment_id
    fill_in "Member", with: @allotment_user.member_id
    click_on "Create Allotment user"

    assert_text "Allotment user was successfully created"
    click_on "Back"
  end

  test "should update Allotment user" do
    visit allotment_user_url(@allotment_user)
    click_on "Edit this allotment user", match: :first

    fill_in "Admin", with: @allotment_user.admin_id
    fill_in "Allotment", with: @allotment_user.allotment_id
    fill_in "Member", with: @allotment_user.member_id
    click_on "Update Allotment user"

    assert_text "Allotment user was successfully updated"
    click_on "Back"
  end

  test "should destroy Allotment user" do
    visit allotment_user_url(@allotment_user)
    click_on "Destroy this allotment user", match: :first

    assert_text "Allotment user was successfully destroyed"
  end
end
