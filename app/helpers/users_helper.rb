# frozen_string_literal: true

module UsersHelper
  def likes_helper(liked_id)
    Article.find(liked_id.article_id)
  end
end
