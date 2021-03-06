class Album < ActiveRecord::Base  
  has_many :photos
  validates_presence_of :name, :description, :flickbook_url, :photographer
  
  def shuffle_thumbnail!
    photo =  photos.landscape.random
    self.headline_photo_url = photo.thumbnail_1024_url
    self.headline_thumbnail_32_url = photo.thumbnail_32_url
    self.save!
  end

  def mobile_layouts
    make_layouts_with_classes  [LayoutMobile]
  end
  
  def create_layouts
    make_layouts_with_classes  [LayoutHeadline, LayoutThreeInARow]
  end
  
  private 
  
  def make_layouts_with_classes layouts
    temp_photos = photos
    layout_list = []
    until temp_photos.empty?
      layout_class = layouts[(rand layouts.size)]
      layout = layout_class.new
      if layout.can_take_photos_from? temp_photos
        layout.take_photos_from! temp_photos
        layout_list << layout    
      end
    end
    layout_list
  end
end
