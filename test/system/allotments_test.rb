require "application_system_test_case"

class AllotmentsTest < ApplicationSystemTestCase
  setup do
    @allotment = allotments(:one)
  end

  test "visiting the index" do
    visit allotments_url
    assert_selector "h1", text: "Allotments"
  end

  test "should create allotment" do
    visit allotments_url
    click_on "New allotment"

    fill_in "Description", with: @allotment.description
    fill_in "End date", with: @allotment.end_date
    fill_in "Name", with: @allotment.name
    fill_in "Size", with: @allotment.size
    fill_in "Start date", with: @allotment.start_date
    click_on "Create Allotment"

    assert_text "Allotment was successfully created"
    click_on "Back"
  end

  test "should update Allotment" do
    visit allotment_url(@allotment)
    click_on "Edit this allotment", match: :first

    fill_in "Description", with: @allotment.description
    fill_in "End date", with: @allotment.end_date
    fill_in "Name", with: @allotment.name
    fill_in "Size", with: @allotment.size
    fill_in "Start date", with: @allotment.start_date
    click_on "Update Allotment"

    assert_text "Allotment was successfully updated"
    click_on "Back"
  end

  test "should destroy Allotment" do
    visit allotment_url(@allotment)
    click_on "Destroy this allotment", match: :first

    assert_text "Allotment was successfully destroyed"
  end
end
