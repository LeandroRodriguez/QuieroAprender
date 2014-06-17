QuieroAprender::Application.routes.draw do

  resources :courses
  resources :user_sessions
  resources :users  # give us our some normal resource routes for users
  resource :user, :as => 'account'  # a convenience route

  match 'login' => "user_sessions#new",      :as => :login, via: [:get, :post]
  match 'logout' => "user_sessions#destroy", :as => :logout, via: [:get, :post]
  match 'home' => "welcome#index", :as => :home, via: [:get, :post]
#new
  get '/update_subcategories' => "welcome#update_subcategories", as: 'update_subcategories'
  get '/user' => "user#index"
  #get '/login2' => "user#login"
  get '/user/facebook_login' => "user#facebook_login"
  get '/user/facebook_authorization' => "user#facebook_authorization"
  get '/decode_address' => "welcome#decode_address", as: 'decode_address'
  get '/plans' => "plans#index"
#end new
  match 'signup' => 'users#new', :as => :signup, via: [:get, :post]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  #if current_user
  if defined?(current_user_session.user)
    root :to => "welcome#index"
  else
    root :to => 'user#login'
  end

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
