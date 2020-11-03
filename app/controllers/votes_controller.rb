class VotesController < ApplicationController

  def create
    @vote = current_user.votes.new(article_id: params[:article_id])
    if @vote.save
      redirect_to root_path, notice: 'You Upvoted Article'
    else
      redirect_to root_path, notice: 'You can not Upvote this article'
    end
  end
  
  def destroy
    @vote = Vote.find_by(user_id: current_user.id, article_id: params[:article_id])
    if @vote
      @vote.destroy
      redirect_to root_path, notice: 'You Downvoted a Article.'
    else
      redirect_to root_path, alert: 'You cannot Downvote post that you did not Upvote before.'
    end
  end
end