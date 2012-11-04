YardsaleApp::Application.routes.draw do
  get "users/new"

  resources :users do
    member do
      get :following
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :yardsales do
    member do
      get :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
      
  root to: 'public_pages#home'

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
      
  match '/help',    to: 'public_pages#help'
  match '/about',   to: 'public_pages#about'
  match '/contact', to: 'public_pages#contact'

end
