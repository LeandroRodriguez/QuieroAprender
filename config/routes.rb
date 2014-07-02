QuieroAprender::Application.routes.draw do
  
  resources :welcome
    
  resources :user_sessions
    match 'login' => "user_sessions#new",  :as => :login, via: [:get, :post]
    match 'logout' => "user_sessions#destroy", :as => :logout, via: [:get, :post]

  resources :user_facebook_sessions
    match 'fb_login' => "user_facebook_sessions#login", :as => :fb_login, via: [:get, :post]
    match 'fb_authorization' => "user_facebook_sessions#authorization", :as => :fb_authorization, via: [:get, :post]
    match 'fb_authorization_callback' => "user_facebook_sessions#authorization_callback", :as => :fb_authorization_callbak, via: [:get, :post]
    match 'fb_publish_wall_post' => "user_facebook_sessions#publish_wall_post", :as => :fb_publish_wall_post, via: [:get, :post]
    match 'fb_logout' => "user_facebook_sessions#logout", :as => :fb_logout, via: [:get, :post]
    
  resources :users  # give us our some normal resource routes for users
  #resource :user, :as => 'account'  # a convenience route
    match 'signup' => 'users#new', :as => :signup, via: [:get, :post]
  
  resources :plans
    match 'plans' => "plans#index", :as => :plans_index, via: [:get, :post]
  
  resources :teachers
    match 'home' => "welcome#index", :as => :home, via: [:get, :post]
  
  get '/update_subcategories' => "welcome#update_subcategories", as: 'update_subcategories'

  get '/decode_address' => "welcome#decode_address", as: 'decode_address'
  get '/courses/update_subcategories_courses' , as: 'update_subcategories_courses'
  resources :courses do
    resources :opinions, :only => [:create]
    resources :consultations, :only => [:create]
  end
  resources :advertisings
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root :to => "welcome#index"

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
