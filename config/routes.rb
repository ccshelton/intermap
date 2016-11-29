Rails.application.routes.draw do
  devise_for :users

  constraints subdomain: true do
    root to: 'apps#index'
  end

  constraints subdomain: false do
    get '/', :to => 'pages#home'
  end
end
