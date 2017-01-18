Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    get '/settings', :to => "pages#settings"
  end

  constraints subdomain: true do
    root to: 'apps#index'
  end

  constraints subdomain: false do
    get '/', :to => 'pages#home'
  end

  resources :apps, only: [:index, :new, :create, :update]
end
