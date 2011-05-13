class LayoutThreeInARow < Object
  
  def take_photos_from! photos
    @photos = photos.shift 3
  end
    
  def can_take_photos_from? photos
    photos.size > 3
  end
    
  def render 
    output = '<div class="photos_3">'
    @photos.each do |photo|
      output << photo.full_image_html( {:width => 320, :height => 320})
    end
    output << '</div>'
  end
end
