Rails.application.routes.draw do
  
  resources :customers, only: [:index]
  resources :movies, except: [:new, :delete]
  
  post "/rentals/check-in", to: "rentals#check-in", as: "check-in"
  post "/rentals/check-out", to: "rentals#check-out", as: "check-out"


end
