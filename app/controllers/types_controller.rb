class TypesController < ApplicationController
  before_action :authenticate_user!

  def index
    @types = Type.all
    @articles = Article.all
    @sports = Type.find_by(name: 'Sports')
    @entertainment = Type.find_by(name: 'Entertainment')
    @travel = Type.find_by(name: 'Travel')
    @politics = Type.find_by(name: 'Politics')
    @tech = Type.find_by(name: 'Tech')
    @business = Type.find_by(name: 'Business')
    @fashion = Type.find_by(name: 'Fashion')
  end

  def show
  end
  
  def search
    @articles = Article.where("title LIKE ?", "%" + params[:q] + "%")
  end
  
  def new
    @type = Type.new
  end
  
  def create
    type = Type.new(type_params)
    if type.save
      flash[:success] = "Type successfully created"
      redirect_to type
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def destroy
    type = Type.find(params[:id])
    if type.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to type_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to reviews_url
    end
  end
  
  private

  def set_type
  end

  def type_params
    params.require(:review).permit(:name)
  end
  
end