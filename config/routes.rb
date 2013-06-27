Catcher::Application.routes.draw do
  root :to => 'static#index'

  namespace :api do
    match '/logout' => 'sessions#destroy'
    resource  :sessions, only: [:create, :destroy]
    resources :users
    resources :entries, except: [:show] do
    end
    resources :url_extractions, only: [:show]
    # get "/url_extractions/:id" => "urlExtractions#extract_props"

    match "*path", :to => "base#routing_error" unless Rails.env.test?
  end
end
