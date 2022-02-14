# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true
  validates :tag_name, presence: true, length: { maximum: 50 }
  validates :category_id, presence: true
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :category

  def save_tags(article_tag)
    article_tag.each do |tag|
      Tag.find_or_create_by(name: tag)
    end
  end
end
