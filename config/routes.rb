Rails.application.routes.draw do
 
  get '/workouts/type_exercises' => "workouts#type_exercises"
  resources :exercises
  resources :workouts
  resources :types
  resources :users_workouts
  devise_for :users
  root 'workouts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
