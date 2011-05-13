class Album < ActiveRecord::Base
  has_many :photos
  validates_presence_of :name, :description, :flickbook_url
  
  def shuffle_thumbnail!
    self.thumbnail_32_url = photos.random.thumbnail_32_url
    save!
  end

  def create_layouts
    temp_photos = photos
    layout_list = []
    until temp_photos.empty?
      layouts =  [LayoutHeadline, LayoutThreeInARow]
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
