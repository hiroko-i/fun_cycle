class User::HomesController < ApplicationController
  def top
    @posts = Post.order(created_at: :desc).limit(12)
  end

  def about
  end
end
