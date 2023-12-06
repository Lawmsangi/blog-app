Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/create'
  resources :users do
    resources :posts do
      resources :comments
      resources :likes
    end
  end
  root 'users#index'
end
