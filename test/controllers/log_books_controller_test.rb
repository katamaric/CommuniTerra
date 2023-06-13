require "test_helper"

class LogBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @log_book = log_books(:one)
  end

  test "should get index" do
    get log_books_url
    assert_response :success
  end

  test "should get new" do
    get new_log_book_url
    assert_response :success
  end

  test "should create log_book" do
    assert_difference("LogBook.count") do
      post log_books_url, params: { log_book: { content: @log_book.content, entry_date: @log_book.entry_date, mood_id: @log_book.mood_id, owned_plant_id: @log_book.owned_plant_id, title: @log_book.title } }
    end

    assert_redirected_to log_book_url(LogBook.last)
  end

  test "should show log_book" do
    get log_book_url(@log_book)
    assert_response :success
  end

  test "should get edit" do
    get edit_log_book_url(@log_book)
    assert_response :success
  end

  test "should update log_book" do
    patch log_book_url(@log_book), params: { log_book: { content: @log_book.content, entry_date: @log_book.entry_date, mood_id: @log_book.mood_id, owned_plant_id: @log_book.owned_plant_id, title: @log_book.title } }
    assert_redirected_to log_book_url(@log_book)
  end

  test "should destroy log_book" do
    assert_difference("LogBook.count", -1) do
      delete log_book_url(@log_book)
    end

    assert_redirected_to log_books_url
  end
end
