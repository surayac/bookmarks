require "test_helper"

class BookmarkTest < ActiveSupport::TestCase
  test "is valid with a title and url" do
    bookmark = Bookmark.new(title: "Example", url: "https://example.com", favorite: false)

    assert bookmark.valid?
  end

  test "requires a title" do
    bookmark = Bookmark.new(url: "https://example.com")

    assert_not bookmark.valid?
    assert_includes bookmark.errors[:title], "can't be blank"
  end

  test "requires a valid http or https url" do
    bookmark = Bookmark.new(title: "Example", url: "not-a-url")

    assert_not bookmark.valid?
    assert_includes bookmark.errors[:url], "must be a valid URL"
  end

  test "strips whitespace from url before validation" do
    bookmark = Bookmark.new(title: "Example", url: "  https://example.com  ")

    assert bookmark.valid?
    assert_equal "https://example.com", bookmark.url
  end
end
