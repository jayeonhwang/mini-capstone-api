Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/products" => "products#index"
  get"/products/:id" => "products#show"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "/products/:id" =>"products#destroy"

  post"/users" => "users#create"
  post"/sessions" => "session#create"
  
  get"/orders/:id" => "orders#show"
  get "/orders" => "orders#index"
  post "/orders" => "orders#create"

  get "/cart" => "carted_products#index"
  post "/cart" => "carted_products#create"
  delete "/cart/:id" => "carted_products#destroy"
end
