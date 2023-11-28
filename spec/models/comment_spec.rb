require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'John Doe', photo: 'photo', bio: 'bio') }
  let(:post) { Post.create(title: 'title', text: 'text', author: user) }

  let(:comment) { Comment.new(text: 'text', user_id: user.id, post_id: post.id) }

  before { comment.save }

  it 'is valid with valid attributes' do
    expect(comment).to be_valid
  end
end
