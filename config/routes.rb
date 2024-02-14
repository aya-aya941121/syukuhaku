Rails.application.routes.draw do
  root 'rooms#index'
 
 
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
 
 
  resources :rooms, only: [:index, :show, :new, :create] do
    collection do
      get 'search'
      get 'list'
      get 'photo_url'
    end

  end
 
  get '/reservations/confirm', to: 'reservations#confirm', as:'reservation_confirm'
  resources :reservations, only: [:index, :show, :new, :create]
  resources :users, only: [:show, :edit, :update, :new, :create], param: :id

  get '/users/edit_profile', to: 'users#edit', as: 'edit_profile'
  get '/rooms/list', to: 'rooms#list', as: 'room_list'
  

  
  # devise_for :users, controllers: {
  #        sessions: 'users/sessions'
  #      }
 end
 