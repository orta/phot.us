class AddThumbnail320UrlToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :thumbnail_320_url, :string
  end
end
