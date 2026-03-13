
#typed: strict

class BookmarksController < ApplicationController
    extend T::Sig

    sig {void}
    def index
        @bookmarks = Bookmark.all
    end
end
