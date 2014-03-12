CourseReview::Application.routes.draw do

  root 'sessions#new'

  get "/home" => 'courses#home'

  # Session-related URLs
  get "/login" => 'sessions#new'
  get "/logout" => 'sessions#destroy'
  get "/authenticate" => 'sessions#create'

  # User-related URLs
  get "/users/new" => 'users#new'
  get "/users/create" => 'users#create'
  get "/users/:user_id/show" => 'users#show'
  get "/users/:user_id/edit" => "users#edit"
  get "/users/:user_id/update" => "users#update"

  # Course-related URLs

  # CREATE
  get "/courses/new" => "courses#new"
  get "/courses/create" => "courses#create"

  # READ
  get "/courses" => 'courses#index'
  get "/courses/:course_id/show" => "courses#show"

  # UPDATE
  get "/courses/:course_id/edit" => "courses#edit"
  get "/courses/:course_id/update" => "courses#update"

  # DELETE
  get "/courses/:course_id/delete" => "courses#destroy"


  # Review-related URLs

  get "/reviews/create" => 'reviews#create'

end
