class AddThumbnail1024UrlToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :thumbnail_1024_url, :string
  end
end
