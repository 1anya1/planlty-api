Rails.application.routes.draw do
  resources :plants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/login',    to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
  resources :users, only: [:create, :show, :index] do 
    resources :todos, only: [:index, :show, :create, :destroy] do
      resources :plants, only: [:index, :show, :create, :destroy]
    end
  end
end

