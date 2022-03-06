# frozen_string_literal: true

class SearchesController < ApplicationController
  def search
    @articles = Article.search(params[:word]) # 検索機能
  end
end
