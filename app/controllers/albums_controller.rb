class AlbumsController < ApplicationController

  def index
    @albums = Album.all 
    render :index
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

# Nested New Album

# <input type="hidden" name="album[band_id]" value="<%= params[:band_id] %>">
  def new

    @band = Band.find(params[:band_id])
    render :new

  end

  def create
    
    @album = Album.new(album_params)
    @album.save
    redirect_to band_url(@album.band_id)

  end

  def edit
    @album = Album.find(params[:id])
    # debugger
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    @album.band_id = params[:band_id ]
    @album.update(album_params)
    # debugger
    redirect_to band_url(@album.band_id)
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to band_url(@album.band_id)
  end

  def album_params
    params.require(:album).permit(:band_id, :title, :year)
  end
end
