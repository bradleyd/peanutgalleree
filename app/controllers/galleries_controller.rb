class GalleriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @galleries = current_user.galleries
  end

  def new
    @user = current_user
    @gallery = @user.galleries.build
  end

  def show
    @user = current_user
    @gallery = Gallery.find(params[:id])
  end

  def create
    @user = current_user
    @gallery = @user.galleries.build(gallery_params)
    if @gallery.save
      redirect_to @gallery, notice: "Your new gallery is created!"
    else
      render :new
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    redirect_to galleries_url
  end

  def update
  end

  def edit
  end

  private
  def gallery_params
    params.require(:gallery).permit(:name)
  end
end
