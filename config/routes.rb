Catcher::Application.routes.draw do
  root :to => 'static#index'

  namespace :api do
    match '/logout' => 'sessions#destroy'
    resource  :sessions, only: [:create, :destroy]
    resources :users
    resources :entries, except: [:show] do
    end
    post "/url_data" => "entries#url_data"

    match "*path", :to => "base#routing_error" unless Rails.env.test?
  end
end
