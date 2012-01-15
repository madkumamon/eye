class CommentsController < ApplicationController

  def index
    @comments = Comment.includes([:gallery,:user]).all
  end

  def create
    img = Gallery.find_by_id(params[:gallery_id])
    current_user.comments.create(:gallery => img, :message => params[:comment][:message])
    redirect_to :back
  end

end
