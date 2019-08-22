Rails.application.routes.draw do
  resources :equipments do
    resources :reservations, only: %i[new create]
  end
  resources :reservations, only: %i[show destroy]

  get :my_equipments, to: 'equipments#my_index'
  get :my_reservations, to: 'reservations#my_index'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
