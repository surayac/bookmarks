class SetDefaultForBookmarksFavorite < ActiveRecord::Migration[8.1]
  def change
    change_column_default :bookmarks, :favorite, from: nil, to: false
    change_column_null :bookmarks, :favorite, false, false
  end
end
