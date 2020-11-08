class TypesController < ApplicationController
  before_action :authenticate_user!

  def index
    @types = Type.includes(background_attachment: :blob).limit(4)
    @popular = Vote.popular.includes(:article, article: [:rich_text_body, {cover_attachment: :blob}])
    @sports = Article.with_rich_text_body.includes(:votes, cover_attachment: :blob).where(type_id: 1)
    @entertainment = Article.with_rich_text_body.includes(:votes, cover_attachment: :blob).where(type_id: 2)
    @travel = Article.with_rich_text_body.includes(:votes, cover_attachment: :blob).where(type_id: 7)
    @politics = Article.with_rich_text_body.includes(:votes, cover_attachment: :blob).where(type_id: 4)
    @tech = Article.with_rich_text_body.includes(:votes, cover_attachment: :blob).where(type_id: 3)
    @business = Article.with_rich_text_body.includes(:votes, cover_attachment: :blob).where(type_id: 5)
    @fashion = Article.with_rich_text_body.includes(:votes, cover_attachment: :blob).where(type_id: 6)
  end

  def show
    @count = 1
    @type = Type.includes(:articles, articles: [:votes, {cover_attachment: :blob}, :rich_text_body, :author]).find(params[:id])
  end

  def search
    @articles = Article.with_rich_text_body.includes(cover_attachment: :blob).where('title LIKE ?', "%#{params[:q]}%")
  end

  def new
    @type = Type.new
  end

  def create
    type = Type.new(type_params)
    if type.save
      flash[:success] = 'Type successfully created'
      redirect_to type
    else
      flash[:error] = 'Something went wrong'
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

  def set_type; end

  def type_params
    params.require(:review).permit(:name, :background)
  end
end
