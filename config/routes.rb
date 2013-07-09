Catcher::Application.routes.draw do
  root :to => 'static#index'

  namespace :api do
    match '/logout' => 'sessions#destroy'
    resource  :sessions, only: [:create, :destroy]
    resources :users
    resources :projects
    resources :groups
    resources :links

    resources :url_extractions, only: [:show]

    match "*path", :to => "base#routing_error" unless Rails.env.test?
  end
end
