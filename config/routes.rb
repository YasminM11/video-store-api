Rails.application.routes.draw do
  
  resources :rentals, only: [:create, :index, :show]
  resources :customers, only: [:index]
  resources :movies, except: [:new, :delete]
  
end
