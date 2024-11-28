Rails.application.routes.draw do
  devise_for :users

  root to: "events#index"

  resources :events, only: %i[show new create]

  get "search", to: "events#search", as: :search

  get "up" => "rails/health#show", as: :rails_health_check

end
