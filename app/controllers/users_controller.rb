class UsersController < ApplicationController
  before_action :user_authenticate, only: [:show, :edit, :update]

  def show
    @user = User.find(current_user.id)
    @user_tweets = Tweet.where(user_id: "#{@user.id}")
    @user_tweets_view = @user_tweets.all.order("created_at DESC")
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to user_path(params[:id])
    else
      render action: "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :image)
  end

  def user_authenticate
    @user = User.find_by(id: params[:id])
    if @user.id != current_user.id
      redirect_to root_path
    end
  end
end
