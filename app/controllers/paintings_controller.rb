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
  end

  def show
    @painting = Painting.find(params[:id])
  end

  private
  def painting_params
    params.require(:painting).permit(:name, :description, :gallery_id)
  end
end
