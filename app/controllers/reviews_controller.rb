class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  
  def create
    @review = Review.new(review_params)
    @review.article_id = params[:article_id]
    @review.reviewer = current_user
    if @review.save
      flash[:success] = "Object successfully created"
      redirect_to article_path(@review.article_id)
    else
      flash[:error] = "Something went wrong"
      render 'new'
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

  def set_review
    
  end

  def review_params
    params.require(:review).permit(:title, :body)
  end
  
end