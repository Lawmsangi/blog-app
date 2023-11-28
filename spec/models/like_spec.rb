require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'John Doe', photo: 'photo', bio: 'bio') }
  let(:post) { Post.create(title: 'title', text: 'body', author: user) }

  let(:like) { Like.new(post_id: post.id, user_id: user.id) }
  before { like.save }

  it 'is valid with valid attributes' do
    expect(like).to be_valid
  end

  it 'update likes_counter after saving' do
    post.reload
    expect(post.likes_counter).to eq(1)
  end
end
