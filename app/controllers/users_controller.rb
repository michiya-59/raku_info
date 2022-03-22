# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def user_confirm
    @user = User.new(users_params)
    render 'new' unless @user.valid?
  end

  def create
    @user = User.new(users_params)
    if @user.save
      login(@user)
      flash[:success] = '新規登録が出来ました'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @articles = Article.where(user_id: @user)
    if params[:like] == 'true'
      @liked_article_ids = Like.where(user_id: @user)
    else
      @articles = Article.where(user_id: @user)
    end
  end

  def articles
    @user = User.find(params[:id])
    if params[:like] == 'true' # プロフィール投稿一覧アクション
      @liked_article_ids = Like.where(user_id: @user)
    else
      @articles = Article.where(user_id: @user)
    end
  end

  def likes
    @user = User.find(params[:id])
    if params[:like] == 'true' # プロフィールいいね一覧アクション
      @liked_article_ids = Like.where(user_id: @user)
    else
      @articles = Article.where(user_id: @user)
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def users_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
