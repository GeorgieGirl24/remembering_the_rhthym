Rails.application.routes.draw do
  resources :photo_tags
  resources :tags
  resources :photos
  resources :concerts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
