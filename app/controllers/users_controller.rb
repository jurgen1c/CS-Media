class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.includes(avatar_attachment: :blob).all
  end

  def show
    @user = User.includes(:articles, :followings, avatar_attachment: :blob,
                                                  articles: [{ cover_attachment: :blob }, :rich_text_body, :votes],
                                                  followings: :follow).find(params[:id])
  end
end
