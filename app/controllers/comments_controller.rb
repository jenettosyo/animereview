class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comments_params)
    @comment.save
    redirect_to tweet_path(@comment.tweet.id)
  end

  private
  def comments_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
