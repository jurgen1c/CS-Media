class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    timeline_arts
  end

  private

  def timeline_arts
    @timeline_arts ||= Article.all.ordered_by_most_recent.includes(:user)
  end
end