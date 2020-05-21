Rails.application.routes.draw do
  get 'categories/new'
  get 'categories/index'
  get 'categories/show'
  get 'session/new'
  get 'users/new'
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles
  get 'signup', to: 'users#new'
  resources :users, expect: [:new]
  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  delete 'logout', to: 'session#destroy'
end
