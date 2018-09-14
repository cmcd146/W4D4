class AlbumsController < ApplicationController

  def new
    render :new
  end

  def create
    album = Album.new(album_params)
    if album.save!
      redirect_to album_url(album)
    else
      flash.now[:errors] = album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find_by(id: params[:id])
    render :edit
  end

  def show
    render :show
  end

  def update
    byebug
    album = Album.find_by(id: params[:id])
    if album.update
      redirect_to album_url(album)
    else
      byebug
      flash.now[:errors] = album.errors.full_messages
      render :edit
    end
  end

  def destroy
    album = Album.find_by(id: params[:id])
    album.destroy
    redirect_to bands_url
  end


  private

  def album_params
    params.require(:album).permit(:title, :year, :band_id, :live)
  end
end
