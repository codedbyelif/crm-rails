Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :customers do
        resources :interactions, only: [ :index ]
      end
      resources :leads do
        resources :interactions, only: [ :index ]
      end
      resources :interactions
    end
  end

  get "dashboard", to: "dashboard#index"
  root "dashboard#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
