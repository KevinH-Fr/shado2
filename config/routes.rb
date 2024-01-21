Rails.application.routes.draw do
  resources :subscriptions
  resources :sports
  resources :campaigns
  resources :posts
  resources :fans
  resources :athletes
  devise_for :users
  get 'pages/index'


  get 'purchase_success', to: 'stripe#purchase_success'

  post 'create-checkout-session', to: 'campaigns#create_checkout_session'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
   root "pages#index"
end