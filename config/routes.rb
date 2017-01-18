Rails.application.routes.draw do
  devise_for :admins

  namespace :admin do
    get '/settings', :to => "pages#settings"
  end

  constraints subdomain: true do
    devise_for :users
    root to: 'apps#index'
  end

  constraints subdomain: false do
    get '/', :to => 'pages#home'
  end

  resources :apps, only: [:index, :new, :create, :update]
end
