class AddIsLandscapeToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :is_landscape, :bool
  end
end
