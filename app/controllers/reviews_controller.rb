class ReviewsController < ApplicationController
  def create
    @review = current_user.reviews.new(review_params)
    @review.article_id = params[:article_id]
    if @review.save
      flash[:success] = 'Object successfully created'
      redirect_to article_path(@review.article_id)
    else
      flash[:error] = 'Something went wrong'
    end
  end

  def destroy
    @review = Review.find_by(article_id: params[:id])
    if @review.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to article_path(@review.article_id)
    else
      flash[:error] = 'Something went wrong'
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body)
  end
end
