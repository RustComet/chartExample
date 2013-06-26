Charts::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users

  resources :home
  resources :charts

  get "mixpanel" => "charts#mixpanel_api"
end