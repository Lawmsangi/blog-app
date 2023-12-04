require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  let!(:user) { User.create(name: 'John Doe', photo: 'photo', bio: 'bio') }
  let!(:post) { Post.create(title: 'title', text: 'text', author: user) }

  describe 'GET #index' do
    it 'returns a success response' do
      get users_path
      expect(response).to have_http_status(:ok)
    end

    it 'renders a correct template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'returns response body with correct placeholder text' do
      get users_path
      expect(response.body).to include('Users')
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get user_path(user)
      expect(response).to have_http_status(:ok)
    end

    it 'renders a correct template' do
      get user_path(user)
      expect(response).to render_template(:show)
    end

    it 'returns response body with correct placeholder text' do
      get user_path(user)
      expect(response.body).to include('User')
    end
  end
end
