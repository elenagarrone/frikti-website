class GalleriesController < ApplicationController

  def index
    @galleries = Gallery.all
  end

  def new
    @gallery = Gallery.new
  end 

  def create
    @gallery = Gallery.create(gallery_params)
    if @gallery.save
      flash[:notice] = "The gallery has been created."
      redirect_to galleries_path
    else
      flash[:notice] = "Oops, something went wrong. Please try again."
      redirect_to :new
    end
  end

  def gallery_params
    params.require(:gallery).permit(:name)
  end

end
