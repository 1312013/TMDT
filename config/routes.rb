Rails.application.routes.draw do
  get 'users/new'

  get 'home/index'
  root 'home#index'

  resources :backend_post
  resources :admins
  resources :bai_posts

  resources :admins


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  
  get 'login', to: "sessions#new"
  get 'auth/:provider/callback', to: "sessions#create"
  delete 'logout', to: 'sessions#destroy'
  get 'loginAdmin', to: 'admin_sessions#new'
  post 'loginAdmin', to: 'admin_sessions#create'
  delete 'adminlogout', to: 'admin_sessions#destroy'
  get 'signupAdmin', to: 'admins#new'
  post 'signupAdmin', to: 'admins#create'
  resources :admin_sessions
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
