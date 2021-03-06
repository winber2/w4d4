class BandsController < ApplicationController
  before_action :require_login

  def new
    @band = Band.new
    render :new
  end

  def index
    render :index
  end

  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to bands_url
    else
      flash[:errors] = ['Invalid band! Bogus.....']
      redirect_to new_band_url
    end
  end

  def edit
    @band = Band.find_by(id: params[:id])
    render :edit
  end

  def update
    @band = Band.find_by(id: params[:id])

    if @band.update_attributes(band_params)
      redirect_to band_url(@band)
    else
      flash[:errors] = ['Invalid band! Bogus.....']
      redirect_to new_band_url
    end
  end

  def destroy
    @band = Band.find_by(id: params[:id])

    if @band
      @band.destroy
      redirect_to bands_url
    else
      flash[:errors] = ['Band does not exist']
      redirect_to bands_url
    end
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
