class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_post_comments_count

  private

  def update_comments_count
    post.increment!(:comments_counter)
  end
end
