Rails.application.routes.draw do
  devise_for :users
  
  resources :users do
    resources :suggestions
    resources :sport_users
  end

  resources :cities, only: [:show]
  resources :sports

end
