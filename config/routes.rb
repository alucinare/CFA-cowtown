Rails.application.routes.draw do
  # this is the nested routes
  resources :posts do
  	resources :comments
  end
  devise_for :users
  root 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
