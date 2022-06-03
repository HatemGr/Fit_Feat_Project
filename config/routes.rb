Rails.application.routes.draw do
  devise_for :users

  root to: 'static_pages#new', as: 'home'
  resources :static_pages, only: [:index], path: :team, as: 'team'
  
  resources :users do
    resources :suggestions
    resources :sport_users
  end

  resources :cities, only: [:show]
  resources :sports

end
