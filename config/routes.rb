Rails.application.routes.draw do
  resources :questions
  resources :advertisements
  resources :topics do
  	resources :posts, except: [:index]
  end
  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:new, :create]
  post 'users/confirmation' => 'users#confirmation'
  get 'about' => 'welcome#about'
  get 'faq' => 'welcome#faq'
  resources :sessions, only: [:new, :create, :destroy]
  root 'welcome#index'

  
end
