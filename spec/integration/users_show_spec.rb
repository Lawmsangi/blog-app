require 'rails_helper'

RSpec.feature 'User Show Page', type: :feature do
  before do
    @user = create(:user, name: 'User 1', bio: 'Teacher', posts_counter: 4)
    @posts = create_list(:post, 3, author: @user)
    @post = create(:post, text: 'User Post 4', title: 'title', author: @user)
    visit user_path(@user)
  end

  scenario 'displays the user profile information' do
    expect(page).to have_css('.users-image img')
    expect(page).to have_content('User 1')
    expect(page).to have_content('Number of posts:4')
    expect(page).to have_content('Teacher')
    expect(@posts.length).to eq(3)

    @posts.each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text)
    end

    click_link 'See all posts'
    expect(current_path).to eq(user_posts_path(@user))
  end

  scenario 'click the user posts' do
    click_link 'title'
    expect(current_path).to eq(user_post_path(@user, @post))
  end
end
