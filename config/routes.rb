Harmony::Application.routes.draw do

  devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout' }

  resource :profile

  resources :lists do 
    resources :items    
  end  
 
  resources :accounts do
    resources :lists
    resources :notes
    resources :todos
  end

  match 'accounts/:account_id/todos/:id/complete' => 'todos#complete', :as => :complete_todo
  match 'accounts/:id/join' => 'accounts#join', :as => :join_account

  match '/' => 'home#index', :as => :home
  root :to => 'home#index'

end
