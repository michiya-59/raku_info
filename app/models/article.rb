# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true
  validates :tag_name, presence: true, length: { maximum: 50 }
  validates :category_id, presence: true
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :category
  has_many :likes, dependent: :destroy

  def save_tags(articles_tag)
    articles_tag.each do |article_tag|
      # 登録する際にタグがテーブルに存在していなかったら、作成しcountに0を入れる。存在していなかったらfindしているだけ
      Tag.find_or_create_by(name: article_tag) do |tag|
        tag.count = 0
      end
    end
  end

  def self.tag_article(tag_name)
    where(['tag_name like?', "%#{sanitize_sql_like(tag_name)}%"])
  end

  def self.search(search_word)
    Article.where(['title LIKE ? OR tag_name LIKE ? OR body LIKE ?', "%#{sanitize_sql_like(search_word)}%",
                   "%#{sanitize_sql_like(search_word)}%", "%#{sanitize_sql_like(search_word)}%"])
  end

  def liked_by(target_user)
    likes.where(user_id: target_user).exists?
  end
end
