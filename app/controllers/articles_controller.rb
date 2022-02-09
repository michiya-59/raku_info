# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :redirect_not_logged_in

  def index
    @tags = Tag.all
  end

  def show; end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def article_confirm; end

  def create
    @article = Article.new(set_article_params.merge(set_article_category_params))
    tag_list = params[:article][:tag_name].split(',')
    if @article.save
      @article.save_tags(tag_list) # save_tagsというインスタンスメソッドを使って保存している。
      flash[:notice] = 'プロフィールの設定が完了しました'
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit; end

  private

  def set_article_params
    params.require(:article).permit(:title, :tag_name, :body, :user_id)
  end

  def set_article_category_params
    params.require(:category).permit(:category_id)
  end
end
