class AddHeadlinePhotoToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :headline_photo_id, :integer
    remove_column :albums, :thumbnail_32_url
  end
end
