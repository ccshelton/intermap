Rails.application.routes.draw do
  devise_for :admins

  constraints subdomain: true do
    devise_for :users
    get '/', to: 'apps#show'
    resources :apps, only: [:update]

    namespace :admin do
      get '/settings', :to => "pages#settings"
      get '/javascript', :to => "pages#javascript"
    end
  end

  constraints subdomain: false do
    root to: 'pages#home'
    resources :apps, only: [:index, :new, :create]
  end
end
