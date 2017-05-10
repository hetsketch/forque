Rails.application.routes.draw do

  devise_for :users

  resources :users
  resources :topics
  resources :events

  root to: 'welcome#index'
end
