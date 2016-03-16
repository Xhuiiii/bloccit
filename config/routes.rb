Rails.application.routes.draw do
  resources :labels, only: [:show]
  resources :questions
  resources :advertisements
  resources :sessions, only: [:new, :create, :destroy]
  resources :topics do
  	resources :posts, except: [:index]
  end
  resources :posts, only: [] do
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end
  resources :users, only: [:new, :create, :show]

  post 'users/confirmation' => 'users#confirmation'

  get 'about' => 'welcome#about'
  get 'faq' => 'welcome#faq'
  
  root 'welcome#index'

  
end
