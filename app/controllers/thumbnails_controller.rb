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
    @thumbnail_id = @thumbnail.id
    if @thumbnail.save
      flash[:notice] = "The thumbnail has been created."
      redirect_to new_gallery_thumbnail_picture_path(@gallery_id, @thumbnail_id)
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
      flash[:notice] = "The picture has been deleted."
      redirect_to gallery_path(@gallery_id)
    else
      flash[:notice] = "Oops, something went wrong. Please try again."
      redirect_to gallery_path(@gallery_id)
    end
  end

  def sort
    # @thumbnails = Gallery.friendly.find(params[:gallery_id]).thumbnails
    params[:thumbnail].each_with_index do |id, index|
      # @thumb = thumbnails.find_by_id(id)
      # @thumb.update_attributes(position: index + 1)
      Thumbnail.where(id: id).update_all({position: index+1})
    end
    render nothing: true
  end

  def thumbnail_params
    params.require(:thumbnail).permit(:thumb)
  end

end
