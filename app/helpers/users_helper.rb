# frozen_string_literal: true

module UsersHelper
  # いいねボタンから投稿を一つずつ取得していくメソッド
  def likes_helper(liked_id)
    Article.find(liked_id.article_id)
  end
end
