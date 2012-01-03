class FansController < ApplicationController
before_filter :authenticate_user!,  :only => [:create, :edit, :destroy, :new]

  def create
    @fan = current_user.fans.build(:follower_id => params[:follower_id])
    if @fan.save
      flash[:notice] = "You are now a fan."
      redirect_to gallery_path(params['gallery_id'])
    else
      flash[:error] = "Unable to become fan."
      redirect_to gallery_path(params['gallery_id'])
    end
  end

  def destroy
    @fan = current_user.fanss.find(params[:id])
    @fan.destroy
    flash[:notice] = "Removed fan."
    redirect_to current_user
  end

end
