class TweetsController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @tweets = Tweet.all.order("created_at DESC")
  end

  
  def new
    @tweet = Tweet.new
    @user = User.find(current_user.id)
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save(tweet_params)
      redirect_to (tweets_path)
    else
      render action: "new"
    end
  end

  def show
    @tweet = Tweet.find_by(id: params[:id])
  end

  def destroy
    tweet = Tweet.find_by(id: params[:id])
    tweet.destroy
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text, :picture).merge(user_id: current_user.id)
  end
end
