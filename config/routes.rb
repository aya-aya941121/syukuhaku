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
 
  # get 'reservations/new' => 'reservations#new', as: 'new_reservation'
  # post 'reservations/confirm' => 'reservations#confirm', as: 'confirm_reservation'

  get '/reservations/confirm', to: 'reservations#confirm', as: 'reservation_confirm'
  # post 'reservations/:id' => 'reservations#confirm'
  resources :reservations, only: [:index, :show, :new, :create]
  get '/reservations/new', to: 'reservations#new' # 入力画面
  post '/reservations/confirm', to: 'reservations#confirm', as: 'reservations_confirm' # 確認画面
  post '/reservations/back', to: 'reservations#back' # 確認画面から「入力画面に戻る」をクリックしたとき
  # collection do
  #   get :index
  # end
  post '/reservations/index', to: 'reservations#index' # 完了画面

  resources :users, only: [:show, :edit, :update, :new, :create], param: :id

  get '/users/edit_profile', to: 'users#edit', as: 'edit_profile'
  get '/rooms/list', to: 'rooms#list', as: 'room_list'
  

  
  # devise_for :users, controllers: {
  #        sessions: 'users/sessions'
  #      }
 end
 