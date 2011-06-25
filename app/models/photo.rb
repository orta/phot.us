class Photo < ActiveRecord::Base
  belongs_to :album
  validates_presence_of :album, :is_landscape

  after_create :shuffle_album_thumbnail

  scope :landscape, where("photos.is_landscape = 'true'")
  scope :portrait, where("photos.is_landscape = 'false'")
  scope :are_cropped, where("photos.is_cropped = 'false'")
    
  def self.random
    if (c = count) > 0
      first(:offset => rand(c)) 
    end
  end
  
  def thumb_1024_html
    with_link "<img src='#{ thumbnail_1024_url }'>"
  end
  
  def full_image_html (options={})
    if( options[:height] && options[:width] )
      return with_link "<img src='#{ thumbnail_320_url }' height='#{ options[:height] }' width='#{ options[:width] }'>"
    end
  end

  def shuffle_album_thumbnail
    album.shuffle_thumbnail!
  end

 private
 
 def with_link content
   "<a href='#{ thumbnail_1024_url }'>" + content + "</a>"
 end

end
