YardsaleApp::Application.routes.draw do
  get "users/new"

  resources :users do
    resources :comments, only: [:index, :destroy]
    member do
      get :following, :followers
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :yardsales do
    resources :comments, only: [:create, :destroy]
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :search, only: :index
      
  root to: 'public_pages#home'

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
      
  match '/help',    to: 'public_pages#help'
  match '/about',   to: 'public_pages#about'
  match '/contact', to: 'public_pages#contact'
end
