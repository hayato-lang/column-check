Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts, only: [:index, :new, :create, :show] do
    resources :comments, only: :create
  end

  post 'like_post/:id' => 'like_posts#create', as: 'create_like_post'
  delete 'like_post/:id' => 'like_posts#destroy', as: 'destroy_like_post'

  post 'like_comment/:id' => 'like_comments#create', as: 'create_like_comment'
  delete 'like_comment/:id' => 'like_comments#destroy', as: 'destroy_like_comment'
end
