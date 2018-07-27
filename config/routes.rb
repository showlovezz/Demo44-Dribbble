Rails.application.routes.draw do
  devise_for :users

  resources :shots do
  	resources :comments, only: [:create, :destroy]
  	member do
  		put "like", to: "shots#like"
  		put "unlike", to: "shots#unlike"
  	end
  end

  root "shots#index"
end
