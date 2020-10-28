class VotesController
  
  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(params[:vote])
    if @vote.save
      flash[:success] = "Object successfully created"
      redirect_to @vote
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  def destroy
    @vote = Vote.find(params[:id])
    if @vote.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to votes_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to votes_url
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:up_vote, :down_vote)
  end
  
end