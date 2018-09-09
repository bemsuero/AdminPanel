Rails.application.routes.draw do

  root "sessions#user"

  resources :users do
    resources :courses do
      resources :cohorts, only: [:new, :show, :edit, :create, :update, :destroy] do
      resources :students
    end
    end
  resources :cohorts
  resources :students
end

  resources :admins
  resources :pages

  get 'admin_register' => "admins#new"

  get "instructors_register" => "users#new"
  get "instructors_index" => "users#index"
  delete "users/edit"
  get "userresults" => "users#results"

  get "students_index" => "students#index"
  get "studentresults" => "students#results"

  get "login" => "sessions#user"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  get "adminlogin" => "sessions#admin"
  post "adminlogin" => "sessions#admincreate"
  delete "adminlogout" => "sessions#admindestroy"

  get "allcourses" => "courses#index"
  get "courseresults" => "courses#results"

  get "cohorts_index" => "cohorts#index"
    get "cohortresults" => "cohorts#results"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
