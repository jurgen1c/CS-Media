class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def new
    @review = current_user.reviews.build
  end
  
  def create
    @review = current_user.reviews.build(params[:review])
    if @review.save
      flash[:success] = "Object successfully created"
      redirect_to @review
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to reviews_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to reviews_url
    end
  end
  
  private

  def set_review
  
  end

  def review_params
    params.reuire(:review).permit(:title, :body)
  end
  
end