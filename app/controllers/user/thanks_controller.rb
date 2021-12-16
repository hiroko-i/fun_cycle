class User::ThanksController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    thank = current_user.thanks.new(post_id: @post.id)
    thank.save
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    thank = current_user.thanks.find_by(post_id: @post.id)
    thank.destroy
  end
  
end
