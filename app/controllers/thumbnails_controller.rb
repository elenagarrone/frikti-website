class ThumbnailsController < ApplicationController

  def index
    @gallery = Gallery.friendly.find(params[:gallery_id])
  end

  def new 
    @gallery = Gallery.friendly.find(params[:gallery_id])
    @thumbnail = Thumbnail.new
  end

  def create
    @gallery = Gallery.friendly.find(params[:gallery_id])
    @gallery_id = @gallery.friendly_id
    @thumbnail = @gallery.thumbnails.create(thumbnail_params)
    if @thumbnail.save
      flash[:notice] = "The thumbnail has been created."
      redirect_to gallery_path(@gallery_id)
    else
      flash[:notice] = "Oops, something went wrong. Please try again."
      redirect_to new_gallery_thumbnail_path(@gallery_id)
    end
  end

  def destroy
    @gallery = Gallery.friendly.find(params[:gallery_id])
    @gallery_id = @gallery.friendly_id
    @thumbnail = @gallery.thumbnails.find(params[:id])
    @thumbnail.destroy
    if @thumbnail.destroyed?
      flash[:notice] = "The thumbnail has been deleted."
      redirect_to gallery_path(@gallery_id)
    else
      flash[:notice] = "Oops, something went wrong. Please try again."
      redirect_to gallery_path(@gallery_id)
    end
  end

  def thumbnail_params
    params.require(:thumbnail).permit(:thumb)
  end

end
