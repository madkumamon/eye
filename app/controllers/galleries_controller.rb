class GalleriesController < ApplicationController
  before_filter :find_image, :only => [:show, :like]

  def index
    @galleries = Gallery.includes(:category).where("categories.title = ? ", params[:category_id]).paginate(:page => params[:page])
  end

  def all_img
    @galleries = Gallery.order("likes_count DESC").paginate(:page => params[:page])
  end

  def like
    like = @gallery.likes.build(:user_id => current_user.id)
    flash[:error] = "Error" unless like.save
    redirect_to :back
  end

  private

  def find_image
    @gallery = Gallery.find(params[:id])
  end

end
