Rails.application.routes.draw do
  devise_for :admins

  constraints subdomain: true do
    devise_for :users
    get '/', to: 'apps#show'
    resources :apps, only: [:update, :destroy]

    namespace :admin do
      get '/settings', :to => "pages#settings"
      get '/javascript', :to => "pages#javascript"
      post '/intercom_settings', :to => "pages#intercom_settings"
      post '/render_settings', :to => "pages#render_settings"
    end
  end

  constraints subdomain: false do
    root to: 'pages#home'
    resources :apps, only: [:index, :new, :create]
  end
end
