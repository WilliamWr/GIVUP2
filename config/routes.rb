Rails.application.routes.draw do
  root 'pages#index'

  get '/home' => 'pages#home'

  # get '/orgnew' => 'registrations#orgnew'

  get '/user/:id' => 'pages#profile'

  get '/explore' => 'pages#explore'

  devise_for :users,  :controllers => { :registrations => "registrations" } do
    # match "orgnew", to: "pages#orgnew", via: [:get, :post]
  end

  devise_scope :user do
    get '/orgnew' => "pages#orgnew"
  end

  # resources :posts
  # devise_for :users
  # root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
