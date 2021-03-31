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

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
