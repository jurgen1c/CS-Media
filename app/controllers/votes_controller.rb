class VotesController < ApplicationController

  def create
    @vote = current_user.votes.new(article_id: params[:article_id])
    if @vote.save
      flash[:success] = 'You Upvoted Article'
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = 'You can not Upvote this article'
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    @vote = Vote.find_by(user_id: current_user.id, article_id: params[:article_id])
    if @vote
      @vote.destroy
      flash[:success] = 'You Downvoted a Article.'
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = 'You cannot Downvote post that you did not Upvote before.'
      redirect_back(fallback_location: root_path)
    end
  end
end