Rails.application.routes.draw do
  resources :equipments do
    resources :reservations, only: %i[index new create]
  end
  resources :reservations, only: %i[show destroy]

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
