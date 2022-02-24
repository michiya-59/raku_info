# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :redirect_not_logged_in
  before_action :attribute_article, only: %i[edit article_confirm_edit update]

  include(ArticlesHelper)

  def home
    @articles = Article.all.order(created_at: "DESC")
    @search_tags = Tag.all.limit(8)
    @switch_line = 'home'
  end

  def ruby
    category = Category.find_by(name: params[:action])
    @article_ruby = Article.find_by(category_id: category)
    @switch_line = 'ruby'
  end

  def rails
    @switch_line = 'rails'
  end

  def coldfusion
    @switch_line = 'coldfusion'
  end

  def sql
    @switch_line = 'sql'
  end

  def others
    @switch_line = 'others'
  end

  def index
    @tags = Tag.all
    @article = Article.find(1)
  end

  def show
    @article = Article.find(params[:id])
    @tag_lists = @article.tag_name.split(',')
  end

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

  def edit
    @categories = Category.all
    article_info_delete if params[:back].nil? # フォームの値のセッションを削除している
  end

  def article_confirm_edit
    @article.attributes = set_article_only_params2.merge(set_category_only_params)
    @tag_lists = params[:tag_name].split(',')
    article_info(@article) # フォームの値のセッションにいれている

    return if @article.valid?

    redirect_to edit_article_path(@article, back: 'true')
    flash[:error] = @article.errors.full_messages
  end

  def update
    @article.update(set_article_params)
    tag_list = params[:article][:tag_name].split(',')
    @article.save_tags(tag_list) # save_tagsというインスタンスメソッドを使って保存している。
    redirect_to article_path(@article)
    flash[:success] = '編集完了しました'
  end

  private

  def set_article_only_params
    params.require(:article).permit(:title, :tag_name, :body, :user_id)
  end

  def set_category_only_params
    params.require(:category).permit(:category_id)
  end

  def set_article_only_params2
    params.permit(:title, :tag_name, :body, :user_id)
  end

  def set_article_params
    params.require(:article).permit(:title, :tag_name, :body, :user_id, :category_id)
  end

  def attribute_article
    @article = Article.find(params[:id])
  end
end
