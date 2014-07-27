class GalleriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @galleries = current_user.galleries
  end

  def show
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
