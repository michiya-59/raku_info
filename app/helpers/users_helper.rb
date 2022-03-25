# frozen_string_literal: true

module UsersHelper
  # いいねボタンから投稿を一つずつ取得していくメソッド
  def likes_helper(liked_id)
    Article.find(liked_id.article_id)
  end

  # プロフィールの使用しているタグの表示メソッド
  def tag_lists(articles)
    hashes = []
    articles.each do |article_tag|
      hashes.push(article_tag.tag_name.split(',')) # 連想配列になるが使っているタグを全て取り出す
    end
    hashes.flatten.uniq # flattenで連想配列を一つの配列に変換し、uniqで重複を取り除いている
  end
end
