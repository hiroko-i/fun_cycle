class User::SearchesController < ApplicationController

  def user_index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
    
  end

  def post_index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

end
