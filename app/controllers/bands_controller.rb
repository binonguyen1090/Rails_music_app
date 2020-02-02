class BandsController < ApplicationController
  def index
    @bands = Band.all 
    # redirect_to users_url
    render :index
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    @band.save
    redirect_to users_url
  end
  def edit
    @band = Band.find(params[:id])
    render :edit
  end
  def update
    @band = Band.find(params[:id])
    @band.update(band_params)
    redirect_to users_url
  end
  def destroy
    
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to users_url
  end

  def band_params
    params.require(:band).permit(:name)
  end

end
