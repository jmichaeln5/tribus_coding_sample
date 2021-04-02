Rails.application.routes.draw do
  root 'pages#index'
  devise_for :users

  get 'pages/about'
  get '/dashboard' => 'users#dashboard'

  resources :users do
    resources :sites, shallow: true
  end

  get 'all_sites' => 'sites#all_sites'

  resources :sites, only: [:show, :edit, :update, :destroy] do
    resources :comments, module: :sites
  end

  resources :comments, only: :destroy

  resources :notifications do
    collection do
      post :mark_as_read
    end
  end

end
