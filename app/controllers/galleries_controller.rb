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

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    if @gallery.destroyed?
      flash[:notice] = "The gallery has been deleted."
      redirect_to galleries_path
    else
      flash[:notice] = "Oops, something went wrong. Please try again."
      redirect_to galleries_path
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    @gallery.update(gallery_params)
    if @gallery.save
      flash[:notice] = "The gallery has been edited."
      redirect_to galleries_path
    else
      flash[:notice] = "Oops, something went wrong. Please try again."
      redirect_to edit_gallery_path(@gallery)
    end
  end

  def show
  end

  def gallery_params
    params.require(:gallery).permit(:name)
  end

end
