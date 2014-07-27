class GalleriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @galleries = current_user.galleries
  end

  def show
    @user = current_user
    @gallery = Gallery.find(params[:id])
  end

  def destroy
  end

  def update
  end

  def new
  end

  def edit
  end
end
