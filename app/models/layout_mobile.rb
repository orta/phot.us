class LayoutMobile < Object
  
  def take_photos_from! photos
    @photo = photos.shift
  end
    
  def can_take_photos_from? photos
    photos.size > 0
  end
    
  def render 
    @photo.thumb_1024_html
  end
end