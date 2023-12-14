Rails.application.routes.draw do
  devise_for :users
  get 'comments/new'
  get 'comments/create'
  resources :users do
    resources :posts do
      resources :comments
      resources :likes
    end
  end

  namespace 'api' do
    namespace 'v1' do
      resources :posts, only: [:index] do
        resources :comments, only: [:create, :index]
      end
    end
  end

  root to: 'users#index'
end
