class AddThumbnailUrlToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :thumbnail_32_url, :string
  end
end
