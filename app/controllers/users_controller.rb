# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show articles likes edit update]
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
    @articles = Article.where(user_id: @user)
    if params[:like] == 'true'
      @liked_article_ids = Like.where(user_id: @user)
    else
      @articles = Article.where(user_id: @user)
    end
  end

  def articles
    if params[:like] == 'true' # プロフィール投稿一覧アクション
      @liked_article_ids = Like.where(user_id: @user)
    else
      @articles = Article.where(user_id: @user)
    end
  end

  def likes
    if params[:like] == 'true' # プロフィールいいね一覧アクション
      @liked_article_ids = Like.where(user_id: @user)
    else
      @articles = Article.where(user_id: @user)
    end
  end

  def edit
  end

  def update
    if @user.update(users_params)
      flash[:success] = '編集が完了しました'
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy; end

  private

  def users_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
