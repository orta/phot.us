class ActuallyAddIsCroppedPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :is_cropped, :boolean
  end
end
