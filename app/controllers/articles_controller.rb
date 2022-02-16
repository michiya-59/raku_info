# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :redirect_not_logged_in
  include(ArticlesHelper)

  def index
    @tags = Tag.all
    @article = Article.find(1)
  end

  def show; end

  def new
    @article = Article.new
    @categories = Category.all
    article_info_delete if params[:back].nil? # フォームの値のセッションを削除している
  end

  def article_confirm
    @article = Article.new(set_article_only_params.merge(set_category_only_params))
    @tag_lists = params[:article][:tag_name].split(',')
    article_info(@article) # フォームの値のセッションにいれている
    return if @article.valid?

    redirect_to new_article_path(back: 'true')
    flash[:error] = @article.errors.full_messages
  end

  def create
    @categories = Category.all
    @article = Article.new(set_article_params)
    tag_list = params[:article][:tag_name].split(',')
    if @article.save
      @article.save_tags(tag_list) # save_tagsというインスタンスメソッドを使って保存している。
      flash[:notice] = 'プロフィールの設定が完了しました'
      article_info_delete # フォームの値のセッションを削除している
      redirect_to article_path(@article)
    else
      redirect_to new_article_path(back: 'true')
      flash[:error] = @article.errors.full_messages
    end
  end

  def edit; end

  private

  def set_article_only_params
    params.require(:article).permit(:title, :tag_name, :body, :user_id)
  end

  def set_category_only_params
    params.require(:category).permit(:category_id)
  end

  def set_article_params
    params.require(:article).permit(:title, :tag_name, :body, :user_id, :category_id)
  end

end
