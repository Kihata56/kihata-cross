Rails.application.routes.draw do

  devise_for :users
  root "messages#index"
  resources :users, only: [:edit, :update]
  resources :posts, only: [:index, :new, :create] do
  
  end
end
