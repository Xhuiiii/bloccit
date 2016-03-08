Rails.application.routes.draw do
  resources :questions
  resources :advertisements
  resources :topics do
  	resources :posts, except: [:index]
  end
  resources :users, only: [:new, :create]
  post 'users/confirmation' => 'users#confirmation'
  get 'about' => 'welcome#about'
  resources :sessions, only: [:new, :create, :destroy]
  
  root 'welcome#index'

  
end
