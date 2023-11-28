class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  after_create :update_user_posts_count

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_user_posts_count
    post_count = author.posts.count
    author.update(posts_counter: post_count)
  end
end
