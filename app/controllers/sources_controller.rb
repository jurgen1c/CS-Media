class SourcesController < ApplicationController
  before_action :set_source, only: [:show, :edit, :update, :destroy]

  def new
    @source = Source.new
  end
  
  def create
    @source = Source.create(source_params)
    if @source.save
      flash[:success] = "Object successfully created"
      redirect_to @source
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  def destroy
    @source = Source.find(params[:id])
    if @source.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to sources_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to sources_url
    end
  end
  
  
  private
  def set_source
    @source = Source.find(params[:id])
  end
  def source_params
    params.require(:source).permit(:title, :body)
  end
end