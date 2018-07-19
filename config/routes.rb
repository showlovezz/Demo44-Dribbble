Rails.application.routes.draw do
  resources :shots
  root "shots#index"
end
