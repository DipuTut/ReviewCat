Rails.application.routes.draw do
  devise_for :users
resources :cats  
root 'cats#index'
end
