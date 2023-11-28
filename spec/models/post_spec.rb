require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'John Doe', photo: 'photo', bio: 'bio') }
  let(:post) { Post.new(title: 'title', text: 'body', author: user) }
  before { post.save }

  it 'is valid with valid attributes' do
    expect(post).to be_valid
  end

  it 'is not valid without a title' do
    post.title = ''
    expect(post).to_not be_valid
  end

  it 'is not valid with a title longer than 250 characters' do
    post.title = 'a' * 251
    expect(post).to_not be_valid
  end

  it 'CommentsCounter must be an integer greater than or equal to zero' do
    post.comments_counter = -1
    expect(post).to_not be_valid
  end

  it 'LikesCounter must be an integer greater than or equal to zero' do
    post.likes_counter = -1
    expect(post).to_not be_valid
  end

  it 'should have a recent_comments method' do
    expect(post).to respond_to(:recent_comments)
  end

  it 'calls update_user_posts_count after saving' do
    post.save
    user.reload
    expect(user.posts_counter).to eq(1)
  end
end
