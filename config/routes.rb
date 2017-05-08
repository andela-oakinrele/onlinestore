Rails.application.routes.draw do
  # get 'account/new'
  #
  # get 'account/create'
  #
  # get 'account/update'
  #
  # get 'account/edit'
  #
  # get 'account/destroy'
  #
  # get 'account/index'
  #
  # get 'account/show'

  resources :stores
  resources :users, only: [:new, :create, :edit, :index, :show]
  resources :roles
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
