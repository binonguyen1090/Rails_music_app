class TracksController < ApplicationController


  def index
    @tracks = Track.all 
    render :index
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def new
    @album = Album.find(params[:album_id])
    render :new
  end


  def create
    @track = Track.new(track_params)
    @track.save
    redirect_to album_url(@track.album_id)
  end

  def edit
    render :edit
  end

  def update
    
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy 
    redirect_to album_url(@track.album_id)
  end

  def track_params
    params.require(:track).permit(:title, :album_id)
  end



end
