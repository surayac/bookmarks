
# typed: strict

class BookmarksController < ApplicationController
  extend T::Sig
  before_action :set_bookmark, only: %i[show edit update destroy]

  sig { void }
  def index
    @bookmarks = Bookmark.order(created_at: :desc)
  end

  sig { void }
  def show; end

  sig { void }
  def new
    @bookmark = Bookmark.new(favorite: false)
  end

  sig { void }
  def create
    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save
      redirect_to @bookmark, notice: "Bookmark created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  sig { void }
  def edit; end

  sig { void }
  def update
    if @bookmark.update(bookmark_params)
      redirect_to @bookmark, notice: "Bookmark updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  sig { void }
  def destroy
    @bookmark.destroy
    redirect_to bookmarks_path, notice: "Bookmark deleted successfully."
  end

  private

  sig { void }
  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  sig { returns(ActionController::Parameters) }
  def bookmark_params
    params.require(:bookmark).permit(:title, :url, :favorite)
  end
end
