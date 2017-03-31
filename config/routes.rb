Rails.application.routes.draw do

  get 'admin/index'

  # this is the pregenerated stuff
  # get 'contact/index'
  #
  # get 'contact/mail'

  # this directs the /contact to the contact controller into the index view
  get 'contact', to: "contact#index"
  post 'contact', to: "contact#mail"

  # this is the nested routes
  resources :posts do
  	resources :comments
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  root 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
