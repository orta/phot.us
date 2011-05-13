class AddThumbnail32UrlToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :thumbnail_32_url, :string
  end
end
