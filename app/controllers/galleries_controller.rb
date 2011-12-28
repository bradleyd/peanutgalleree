class GalleriesController < ApplicationController
before_filter :authenticate_user!,  :only => [:create, :edit, :destroy, :new]
  def index
    if current_user
      @galleries = current_user.galleries
    else
      @galleries = Gallery.all
    end
  end

  def show
    @gallery = Gallery.find(params[:id])
    @paintings = @gallery.paintings
  end

  def create
    if current_user
      @gallery = current_user.galleries.build(params[:gallery])
    else
      render :action => "new" and return
    end
    respond_to do |format|
      if @gallery.save
        format.html { redirect_to(@gallery, :notice => 'Gallery was successfully created.') }
        format.xml  { render :xml => @gallery, :status => :created, :location => @gallery }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gallery.errors, :status => :unprocessable_entity }
      end
    end
  end

  def new
    @gallery = Gallery.new
  end

  def edit
  end

  def destroy
  end

end
