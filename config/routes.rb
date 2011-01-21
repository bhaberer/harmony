Harmony::Application.routes.draw do

  devise_for :users 

  resource :profile

  resources :lists do 
    resources :items    
  end  
 
  resources :accounts do
    resources :lists
    resources :notes
    resources :todos
  end

  match 'accounts/:id/join' => 'accounts#join', :as => :join_account

  match '/' => 'home#index', :as => :home
  root :to => 'home#index'

end
