require 'rails_helper'

RSpec.describe 'Post Show Page', type: :feature do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user, title: 'Title', text: 'Text') }
  it 'displays post details' do
    visit user_post_path(user, post)
    expect(page).to have_content(post.title)
    expect(page).to have_content("by #{user.name}")
    expect(page).to have_content("Comments: #{post.comments_counter}")
    expect(page).to have_content("Likes: #{post.likes_counter}")
    expect(page).to have_content(post.text)
  end
  it 'displays comments and commenters' do
    visit user_post_path(user, post)
    post.recent_comments.each do |comment|
      expect(page).to have_content("#{comment.user.name}: #{comment.text}")
    end
  end
end
