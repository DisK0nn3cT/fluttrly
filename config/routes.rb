Fluttr::Application.routes.draw do

  devise_for :users, :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "signup" }
  get "users" => redirect("/users/edit")
  get "user/lists" => "lists#manage"

  resources :tasks
  post 'sms' => "tasks#sms"
  get 'features' => "tasks#features", :as => "features"
  post ':name/lock' => "tasks#lock"
  post ':name/public' => "tasks#public"
  match ':name' => "tasks#index", :as => "index"

  root :to => "tasks#home"
end
