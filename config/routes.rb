Rails.application.routes.draw do
  root 'rooms#index'

  devise_for :users # 追加

  resources :rooms, only: [:index, :show, :new, :create] do
    collection do
      get 'search'
    end
  end

  resources :reservations, only: [:new, :create]
  resources :users, only: [:new, :create]
end