class PaintingsController < ApplicationController

  def index
  end

  def new
    @user = current_user
    @gallery = Gallery.find(params[:gallery_id])
    @painting = @gallery.paintings.new
  end

  def destroy
    @painting = Painting.find(params[:id])
    @painting.destroy
    redirect_to galleries_url, notice: 'Your painting was removed'
  end

  def edit
    @painting = Painting.find(params[:id])
  end

  def create
    @user = current_user
    @gallery = Gallery.find(params[:painting][:gallery_id])
    @painting = @gallery.paintings.new(painting_params)
    if @painting.save
      redirect_to @painting, notice: "Your painting was added."
    else
      render :new
    end
  end

  def update
    @painting = Painting.find(params[:id])
    if @painting.update_attributes(painting_params)
      redirect_to @painting, notice: 'Painting was successfully updated.'
    else
      render :edit 
    end
  end

  def show
    @painting = Painting.find(params[:id])
    @gallery = @painting.gallery
  end

  private
  def painting_params
    params.require(:painting).permit(:name, :description, :gallery_id, :image, :remote_image_url)
  end
end
