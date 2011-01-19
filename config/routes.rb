Harmony::Application.routes.draw do

  devise_for :users

  get "home/index"

  #map.home 'home',                 	:controller => :home,  		:action => :index
  #map.root :controller => :home

end
