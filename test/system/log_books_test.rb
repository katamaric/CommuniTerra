require "application_system_test_case"

class LogBooksTest < ApplicationSystemTestCase
  setup do
    @log_book = log_books(:one)
  end

  test "visiting the index" do
    visit log_books_url
    assert_selector "h1", text: "Log books"
  end

  test "should create log book" do
    visit log_books_url
    click_on "New log book"

    fill_in "Content", with: @log_book.content
    fill_in "Entry date", with: @log_book.entry_date
    fill_in "Mood", with: @log_book.mood_id
    fill_in "Owned plant", with: @log_book.owned_plant_id
    fill_in "Title", with: @log_book.title
    click_on "Create Log book"

    assert_text "Log book was successfully created"
    click_on "Back"
  end

  test "should update Log book" do
    visit log_book_url(@log_book)
    click_on "Edit this log book", match: :first

    fill_in "Content", with: @log_book.content
    fill_in "Entry date", with: @log_book.entry_date
    fill_in "Mood", with: @log_book.mood_id
    fill_in "Owned plant", with: @log_book.owned_plant_id
    fill_in "Title", with: @log_book.title
    click_on "Update Log book"

    assert_text "Log book was successfully updated"
    click_on "Back"
  end

  test "should destroy Log book" do
    visit log_book_url(@log_book)
    click_on "Destroy this log book", match: :first

    assert_text "Log book was successfully destroyed"
  end
end
