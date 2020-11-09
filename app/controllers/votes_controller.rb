class VotesController < ApplicationController
  def create
    @vote = current_user.votes.new(article_id: params[:article_id])
    if @vote.save
      Notification.create(recipient: @vote.article.author, actor: current_user, action: 'voted', notifiable: @vote)
      flash[:success] = 'You Upvoted Article'
    else
      flash[:error] = 'You can not Upvote this article'
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @vote = Vote.find_by(user_id: current_user.id, article_id: params[:article_id])
    if @vote
      @vote.destroy
      flash[:success] = 'You Downvoted a Article.'
    else
      flash[:error] = 'You cannot Downvote post that you did not Upvote before.'
    end
    redirect_back(fallback_location: root_path)
  end
end
