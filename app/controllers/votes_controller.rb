class VotesController
  
  def new
    @vote = current_user.votes.build
  end

  def create
    @vote = current_user.votes.build(article_id: params[:article_id])
    if @vote.save
      flash[:success] = "Object successfully created"
      redirect_to @vote
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  def destroy
    @vote = Like.find_by(id: params[:id], user: current_user, article_id: params[:article_id])
    if @vote
      @vote.destroy
      redirect_to posts_path, notice: 'You disliked a post.'
    else
      redirect_to posts_path, alert: 'You cannot dislike post that you did not like before.'
    end
  end
end