Rails.application.routes.draw do
  get 'sessions/new'
  root "pages#home"

  resources :users
  resources :pages
  resources :courses

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
  
  get "create_course" => "courses#new"
  get 'courses/edit'
  get "course_index" => "courses#index"
  get 'courses/show'

  get 'pages/home'
  get "login" => "pages#login"


  get "instructors_register" => "users#new"
  get "users/edit"
  get "instructors_index" => "users#index"
  get 'users/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
