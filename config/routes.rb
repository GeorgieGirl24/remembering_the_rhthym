Rails.application.routes.draw do
  resources :welcome, :path => '/', only: :index
  resources :photo_tags
  resources :tags
  resources :photos do
    resources :tags
  end
  resources :concerts
  resources :users, only: [:index, :create, :update]

  scope controller: :users do
    get 'registration' => :new, as: :registration
    patch '/user/:id' => :update
    get '/profile' => :show
    get '/profile/edit' => :edit
    get '/profile/edit_password' => :edit_password
  end

  scope controller: :sessions do
    get '/login' => :new
    post '/login' => :login
    get '/logout' => :logout
  end
end
