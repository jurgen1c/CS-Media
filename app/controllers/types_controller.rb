class TypesController < ApplicationController

  def index
    @types = Type.all
  end
  
  def new
    @type = Type.new
  end
  
  def create
    type = Type.new(type_params)
    if type.save
      flash[:success] = "Object successfully created"
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

  def set_review
  end

  def type_params
    params.require(:review).permit(:name)
  end
  
end