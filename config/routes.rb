Rails.application.routes.draw do
  resources :funds
  resources :buys
  resources :projects
  resources :promises
  resources :categories
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'default#home'
  resources :users
end
