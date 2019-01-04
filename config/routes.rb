Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tweets#index'
  get 'tweets' => 'tweets#index'
  get 'tweets/new' => 'tweets#new'
  post 'tweets' => 'tweets#create'
  # delete 'tweets/:id' => 'tweets#destroy'
  delete  'tweets/:id'  => 'tweets#destroy'
  patch 'tweets/:id' => 'tweets#update'
  get   'tweets/:id/edit'  => 'tweets#edit'
  get 'users/:user_id' => 'users#show'
  get 'tweets/:id' => 'tweets#show'
  resources :tweets do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]
end
