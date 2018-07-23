Rails.application.routes.draw do
  devise_for :users
  resources :shots
  root "shots#index"
end
