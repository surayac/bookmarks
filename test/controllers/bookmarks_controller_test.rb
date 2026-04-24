require "test_helper"

class BookmarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bookmark = bookmarks(:one)
  end

  test "should get index" do
    get bookmarks_url

    assert_response :success
    assert_select "h1", "Bookmarks"
  end

  test "should get new" do
    get new_bookmark_url

    assert_response :success
  end

  test "should create bookmark" do
    assert_difference("Bookmark.count", 1) do
      post bookmarks_url, params: {
        bookmark: {
          title: "Example",
          url: "https://example.com",
          favorite: "1"
        }
      }
    end

    assert_redirected_to bookmark_url(Bookmark.order(:created_at).last)
  end

  test "should not create invalid bookmark" do
    assert_no_difference("Bookmark.count") do
      post bookmarks_url, params: {
        bookmark: {
          title: "",
          url: "bad-url",
          favorite: "0"
        }
      }
    end

    assert_response :unprocessable_entity
  end

  test "should show bookmark" do
    get bookmark_url(@bookmark)

    assert_response :success
  end

  test "should get edit" do
    get edit_bookmark_url(@bookmark)

    assert_response :success
  end

  test "should update bookmark" do
    patch bookmark_url(@bookmark), params: {
      bookmark: {
        title: "Updated title",
        url: "https://updated.example.com",
        favorite: "0"
      }
    }

    assert_redirected_to bookmark_url(@bookmark)
    @bookmark.reload
    assert_equal "Updated title", @bookmark.title
    assert_equal "https://updated.example.com", @bookmark.url
    assert_not @bookmark.favorite
  end

  test "should not update bookmark with invalid data" do
    patch bookmark_url(@bookmark), params: {
      bookmark: {
        title: "",
        url: "bad-url"
      }
    }

    assert_response :unprocessable_entity
  end

  test "should destroy bookmark" do
    assert_difference("Bookmark.count", -1) do
      delete bookmark_url(@bookmark)
    end

    assert_redirected_to bookmarks_url
  end
end
