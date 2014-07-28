class PaintingsController < ApplicationController
  def index
  end

  def new
    @user = current_user
    @gallery = Gallery.find(params[:gallery_id])
    @painting = @gallery.paintings.build
  end

  def destroy
  end

  def edit
  end

  def create
    p dbg: params
    @user = current_user
    @gallery = Gallery.find(params[:gallery_id])
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
  end

  private
  def painting_params
    params.require(:painting).permit(:name, :description, :gallery_id)
  end
end
