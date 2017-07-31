Rails.application.routes.draw do
  resources :events
  # resources :users do
  #   member do
  #     get :following, :followers
  #   end
  # end
  resources :relationships

  root 'pages#index'

  get '/followers' => 'pages#follower'
  get '/following' => 'pages#following'

  get '/user/:username/ranks' => 'pages#ranks'

  get '/explore' => 'events#explore'
  get '/create' => 'events#index'
  get '/home' => 'pages#home'
  get '/search' => 'pages#search'
  post '/join' => 'events#join', as: :join
  post '/verified_hours' => 'events#verified_hours', as: :verified_hours

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
