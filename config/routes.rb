Rails.application.routes.draw do
  devise_for :users
resources :cats  
get 'cats/index' 
root 'cats#index'
end
