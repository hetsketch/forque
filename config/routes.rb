Rails.application.routes.draw do

  devise_for :users

  resources :users
  resources :topics

  root to: 'welcome#index'
end
