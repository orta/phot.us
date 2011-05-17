class PhotosController < ApplicationController
  def show
    @photo = Photo.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @photo }
    end
  end

  # GET /albums/1/edit
  def edit
    @album = Album.find(params[:id])
  end

  # POST /albums
  # POST /albums.json
  # {"photo"=>{"medium_square_url"=>"http://s3.amazonaws.com/ortaphotosyeah/rggfddfhhfdfhd_photo_320_0.jpg"}, "album_id"=>"18"}
  def create
    @photo = Photo.new(params[:photo])
    respond_to do |format|
      if @photo.save
        format.json { render :json => @photo, :status => :created, :location => @photobase }
      else
        format.json { render :json => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end
end
