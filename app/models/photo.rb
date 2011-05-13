class Photo < ActiveRecord::Base
  belongs_to :album
  validates_presence_of :album, :is_landscape

  after_create :shuffle_album_thumbnail

  def self.random
    if (c = count) > 0
      first(:offset => rand(c)) 
    end
  end
  
  def thumb_1024_html
    wrap_in_a "<img src='#{ thumbnail_1024_url }'>"
  end
  
  def full_image_html (options={})
    if( options[:height] && options[:width] )
      return wrap_in_a "<img src='#{ thumbnail_320_url }' height='#{ options[:height] }' width='#{ options[:width] }'>"
    end
  end

  def shuffle_album_thumbnail
    album.shuffle_thumbnail!
  end

 private
 
 def wrap_in_a content
   content
 end

end
