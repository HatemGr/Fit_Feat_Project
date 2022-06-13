Rails.application.routes.draw do

  devise_for :users

  root to: 'static_pages#new', as: 'home'
  resources :static_pages, only: [:index], path: :team, as: 'team'
  
  resources :users do
    resources :suggestions
    resources :sport_users
    resources :running_performances, only: [:create,:edit,:update,:destroy]
    resources :climbing_performances, only: [:create,:edit,:update,:destroy]
    resources :workout_performances, only: [:create,:edit,:update,:destroy]
    resources :tennis_performances, only: [:create,:edit,:update,:destroy]
    resources :futsal_performances, only: [:create,:edit,:update,:destroy]
  end

  resources :events
  resources :cities, only: [:show]
  resources :sports

end
