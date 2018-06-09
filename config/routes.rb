Rails.application.routes.draw do
  resources :funds
  resources :buys
  resources :projects
  resources :promises
  resources :categories
  resources :wishlists, constraints: lambda { |req| req.format == :json }
  devise_for :users, controllers: {:omniauth_callbacks => "callbacks"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'default#home'
  resources :users

end


