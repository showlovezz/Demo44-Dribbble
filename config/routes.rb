Rails.application.routes.draw do
  devise_for :users

  resources :shots do
  	resources :comments, only: [:create, :destroy]
  end

  root "shots#index"
end
