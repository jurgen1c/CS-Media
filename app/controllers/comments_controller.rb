class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.user = current_user

    if @comment.save
      redirect_back, notice: 'Comment was successfully created.'
    else
      redirect_back, alert: @comment.errors.full_messages.join('. ').to_s
    end
  end

  def destroy
    @comment = Comment.find_by(article_id: params[:id])
    if @comment.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_back
    else
      flash[:error] = 'Something went wrong'
    end
  end
  

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end