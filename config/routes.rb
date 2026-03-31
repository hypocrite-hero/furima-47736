Rails.application.routes.draw do
  
  root to: "items#index"

  resources :items, only: :index
  
  get "up" => "rails/health#show", as: :rails_health_check
end
