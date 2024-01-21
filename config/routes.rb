Rails.application.routes.draw do

  resources :subscriptions
  resources :sports
  resources :campaigns
  resources :posts
  resources :fans
  resources :athletes
  
  get 'pages/index'
  
  get 'search/index'

  #devise_for :users
  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  get 'users/show'
  get 'users/:id' => 'users#show', as: 'user'

  
  #steps account
  get 'steps_user/fan_account'
  get 'steps_user/fan_subscribe'
  get 'steps_user/athlete_account'
  get 'steps_user/athlete_campaign'


  #stripe
  get 'purchase_success', to: 'stripe#purchase_success'
  post 'create-checkout-session', to: 'campaigns#create_checkout_session'


  # dashboard athlete  
  get 'dashboard_athlete/activities'
  get 'dashboard_athlete/revenues'
  get 'dashboard_athlete/monetization'


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
   root "pages#index"
end
