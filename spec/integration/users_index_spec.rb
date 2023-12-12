require 'rails_helper'

RSpec.feature 'User Index Page', type: :feature do
  before do
    @user1 = create(:user, name: 'User 1', bio: 'Teacher', posts_counter: 5)
    @user2 = create(:user, name: 'User 2', bio: 'Student', posts_counter: 5)
  end

  scenario 'I can see the username of all other users' do
    visit users_path

    expect(page).to have_content('User 1')
    expect(page).to have_content('User 2')
  end

  scenario 'I can see the profile picture for each user' do
    visit users_path

    expect(page).to have_selector('.users-image img', count: 2)
  end

  scenario 'I can see the number of posts each user has written' do
    visit users_path

    expect(page).to have_content('Number of posts:5')
    expect(page).to have_content('Number of posts:5')
  end

  scenario 'When I click on a user, I am redirected to that user\'s show page' do
    visit users_path

    find("a[href='#{user_path(@user1)}']").click
    expect(current_path).to eq(user_path(@user1))
  end
end
