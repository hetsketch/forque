Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  resources :users
  resources :topics
  resources :events
  resources :comments

  resources :companies do
    resources :employees
  end
  root to: 'welcome#index'
end
