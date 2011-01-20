Harmony::Application.routes.draw do


  devise_for :users 

  resource :profile

  resources :accounts do
    resources :notes
  end
  match 'accounts/:id/join' => 'accounts#join', :as => :join_account

  match '/' => 'home#index', :as => :home
  root :to => 'home#index'

end
