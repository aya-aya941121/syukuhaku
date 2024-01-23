Rails.application.routes.draw do
  root 'rooms#index'
 
 
  devise_for :users, controllers: { registrations: 'users/registrations' }
 
 
  resources :rooms, only: [:index, :show, :new, :create] do
    collection do
      get 'search'
    end
  end
 
 
  resources :reservations, only: [:index, :show, :new, :create]
  resources :users, only: [:new, :create]
  # devise_for :users, controllers: {
  #        sessions: 'users/sessions'
  #      }
 end
 