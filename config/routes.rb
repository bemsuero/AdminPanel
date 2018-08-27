Rails.application.routes.draw do
 root "pages#home"

  get 'pages/home'

  resources :users

  get "register" => "users#new"
  get "users/edit"
  get "index" => "users#index"
  get 'users/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
