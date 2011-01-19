Harmony::Application.routes.draw do

  devise_for :users

  resources :accounts

  match '/' => 'home#index'
  root :to => 'home#index'

end
