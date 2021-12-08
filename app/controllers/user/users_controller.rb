class User::UsersController < ApplicationController
  before_action :authenticate_user!


  def show
    @user = User.find(params[:id])
    # @post = @user.post.page
  end

  def edit
  end

  def index
  end

  private

  def user_params
    params.require(@user).permit(:nickname, :profile_image, :description, :prefecture, :bicycle_model, :average_distance, :how_to_enjoy)
  end
end
