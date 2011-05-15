class AddHeadlineUrlToAlbum < ActiveRecord::Migration
  def change
    remove_column :albums, :headline_photo_id
    add_column :albums, :headline_photo_url, :string
    add_column :albums, :headline_thumbnail_32_url, :string
  end
end
