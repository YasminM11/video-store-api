Rails.application.routes.draw do
 
resources :customers, only: [:index]
resources :movies, except: [:new, :delete]
  
end
