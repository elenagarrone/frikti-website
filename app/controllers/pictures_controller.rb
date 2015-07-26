class PicturesController < ApplicationController

  def new 
    @gallery = Gallery.friendly.find(params[:gallery_id])
    @thumbnail = Thumbnail.find(params[:thumbnail_id])
    @picture = Picture.new
  end

  def create
    @gallery = Gallery.friendly.find(params[:gallery_id])
    @gallery_id = @gallery.friendly_id
    @thumbnail = @gallery.thumbnails.find(params[:thumbnail_id])
    @thumbnail_id = @thumbnail.id
    @picture = @thumbnail.create_picture(picture_params)
    @picture_id = @picture.id
    if @picture.save
      flash[:notice] = "The picture has been created."
      redirect_to gallery_path(@gallery_id)
    else
      flash[:notice] = "Oops, something went wrong. Please try again."
      redirect_to new_gallery_thumbnail_picture_path(@gallery_id, @thumbnail_id, @picture_id)
    end
  end

  def picture_params
    params.require(:picture).permit(:picture)
  end
end
