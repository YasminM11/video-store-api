Rails.application.routes.draw do
  
  resources :customers, only: [:index]
  resources :movies, except: [:new, :delete]
  
  post "/rentals/check-in", to: "rentals#check_in", as: "check_in"
  post "/rentals/check-out", to: "rentals#checkout", as: "checkout"


end
