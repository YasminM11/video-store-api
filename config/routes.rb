Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/zomg', to: 'songs#index', as: 'zomg'

  resources :rentals, only: [:create, :index, :show]
  resources :movies, except: [:new, :delete]  

end
