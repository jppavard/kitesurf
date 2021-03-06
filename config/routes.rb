Rails.application.routes.draw do
  resources :equipments do
    resources :reservations, only: %i[new create]
    get :merci, to: 'pages#thankyou'
  end
  resources :reservations, only: %i[show destroy]

  get :my_equipments, to: 'equipments#my_index'
  get :my_reservations, to: 'reservations#my_index'
  get :clients_reservations, to: 'reservations#clients_reservations'


  get :about, to: 'pages#about'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
