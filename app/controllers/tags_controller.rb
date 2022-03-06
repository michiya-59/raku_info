# frozen_string_literal: true

class TagsController < ApplicationController
  def show
    @search_tags = Tag.all.limit(9).order(count: 'DESC') # tag8つまで取得している
    @tag = Tag.find_by(name: params[:name]) # タグのレコードを取得
    @articles = Article.tag_article(@tag.name) # タグ名で投稿名を検索している
    @tag.increment(:count, 1) # 表示順をタグをクリックされた回数分の降順にしている
    @tag.save
  end
end
