Rails.application.routes.draw do
  devise_for :users
  resources :items do
      #resources :addresses, only: [:index, :create]
      resources :orders, only: [:index, :create]
  end
  root to: "items#index"
end
