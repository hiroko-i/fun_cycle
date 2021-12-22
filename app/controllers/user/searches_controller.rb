class User::SearchesController < ApplicationController

  def user_index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(12)
  end

  def post_index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).page(params[:page]).per(12)
  end

end
