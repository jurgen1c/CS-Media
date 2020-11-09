class TypesController < ApplicationController
  before_action :authenticate_user!

  def index
    @types = Type.includes(background_attachment: :blob).all
    @type1 = @types.first
    @popular = Vote.popular.includes(:article, article: [:rich_text_body, { cover_attachment: :blob }])
    @sports = Type.includes(:articles, articles: [:rich_text_body, { cover_attachment: :blob }]).find(1)
    @entertainment = Type.includes(:articles, articles: [:rich_text_body, { cover_attachment: :blob }]).find(2)
    @travel = Type.includes(:articles, articles: [:rich_text_body, { cover_attachment: :blob }]).find(7)
    @politics = Type.includes(:articles, articles: [:rich_text_body, { cover_attachment: :blob }]).find(4)
    @tech = Type.includes(:articles, articles: [:rich_text_body, { cover_attachment: :blob }]).find(3)
    @business = Type.includes(:articles, articles: [:rich_text_body, { cover_attachment: :blob }]).find(5)
    @fashion = Type.includes(:articles, articles: [:rich_text_body, { cover_attachment: :blob }]).find(6)
  end

  def show
    @count = 1
    @type = Type.includes(:articles, articles: [:votes, { cover_attachment: :blob },
                                                :rich_text_body, :author]).find(params[:id])
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
