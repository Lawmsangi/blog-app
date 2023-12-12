require 'rails_helper'

RSpec.feature 'User Post Index Page', type: :feature do
  before do
    @user = create(:user, name: 'User 1', bio: 'Teacher', posts_counter: 6)
    @posts = create_list(:post, 6, author: @user)
    @post = create(:post, author: @user, title: 'Post 1', text: 'Post 1 text', comments_counter: 2, likes_counter: 3)
    visit user_posts_path(@user)
    end
  scenario "displays user's profile information" do
    expect(page).to have_selector('.users-image img', count: 1)
    expect(page).to have_content(@user.name)
    expect(page).to have_content("Number of posts:#{@posts.size+1}")
    @posts.each do |post|
      expect(page).to have_link(post.title, href: user_post_path(@user, post))
      expect(page).to have_content(post.text)
      expect(page).to have_content("Comments:#{post.comments_counter}")
      expect(page).to have_content("Likes:#{post.likes_counter}")
      post.recent_comments.each do |comment|
        expect(page).to have_content("#{comment.user.name}: #{comment.text}")
      end
    end
  end
  scenario 'displays pagination' do
    expect(page).to have_link('Create New Post', href: new_user_post_path(@user))
    expect(page).to have_button('Pagination')
  end
  scenario "clicking on a post redirects to the post's show page" do
    click_link 'Post 1'
    expect(current_path).to eq(user_post_path(@user, @post))
  end
end