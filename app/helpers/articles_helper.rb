# frozen_string_literal: true

module ArticlesHelper
  def article_info(article)
    session[:article_title] = article.title
    session[:article_tag_name] = article.tag_name
    session[:category_id] = article.category_id
    session[:article_body] = article.body
  end

  def article_info_delete
    session.delete(:article_title)
    session.delete(:article_tag_name)
    session.delete(:article_body)
    session.delete(:category_id)
  end

  def template_guide
    "テンプレートを貼り
    一文字でも編集を加えたら右画面に表示されます"
  end
end
