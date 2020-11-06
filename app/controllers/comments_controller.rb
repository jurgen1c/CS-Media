class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.user = current_user

    if @comment.save
      flash[:success] = 'Comment was successfully created.'
    else
      flash[:error] = @comment.errors.full_messages.join('. ').to_s
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @comment = Comment.find_by(article_id: params[:id])
    if @comment.destroy
      flash[:success] = 'Object was successfully deleted.'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
