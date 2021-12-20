class User::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc).page(params[:page]).per(12)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "プロフィールを変更しました"
    else
      render "edit"
    end
  end

  def index
    @users = User.all
    @users = User.page(params[:page]).per(12)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :profile_image, :description, :prefecture_id, :bicycle_model, :average_distance, :how_to_enjoy)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
