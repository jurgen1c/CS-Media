class FollowingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @following = Following.new
  end

  def create
    @following = Following.new(user_id: params[:user_id], follow_id: params[:follow_id])
    if @following.save
      flash[:success] = "Object successfully created"
      redirect_to user_path(params[:user_id])
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def destroy
    @following = Following.find(params[:id])
    if @following.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to users_path
    else
      flash[:error] = 'Something went wrong'
    end
  end
end