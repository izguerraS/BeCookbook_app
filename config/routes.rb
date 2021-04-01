Rails.application.routes.draw do
  namespace :api do
    # RECIPES CONTROLLER
    get "/recipes" => "recipes#index"
    get "/recipes/new" => "recipes#new"
    post "/recipes" => "recipes#create"
    get "/recipes/:id" => "recipes#show"
    get "/recipes/:id/edit" => "recipes#edit"
    patch "/recipes/:id" => "recipes#update"
    delete "/recipes/:id" => "recipes#destroy"

    # USERS CONTROLLER
    post "/users" => "users#create"
    get "/users/:id" => "users#show"

    # SESSIONS CONTROLLER
    post "/sessions" => "sessions#create"
  end
end