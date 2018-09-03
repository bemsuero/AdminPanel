Rails.application.routes.draw do

  root "sessions#user"

  resources :users do
    resources :courses do
      resources :cohorts, only: [:new, :show, :edit, :create, :update]
    end
      resources :cohorts
  resources :students
end




  resources :admins
  resources :pages

  get 'admin_register' => "admins#new"
  get 'admins/show'
  get 'admins/edit'
  get 'admins/index'

  get "instructors_register" => "users#new"
  get "instructors_index" => "users#index"
  get "users/edit"
  delete "users/edit"
  get 'users/show'

  get "students/new"
  get 'students/edit'
  get "students/show"
  get 'students/index'

  get "login" => "sessions#user"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  get "adminlogin" => "sessions#admin"
  post "adminlogin" => "sessions#admincreate"
  delete "adminlogout" => "sessions#admindestroy"

  get "courses/new"
  get 'courses/edit'
  get "allcourses" => "courses#index"
  get 'courses/show'

  get 'cohorts/new'
  get 'cohorts/edit'
  get 'cohorts/show'
  get 'cohorts/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
