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
  root to: 'users#index'
end
