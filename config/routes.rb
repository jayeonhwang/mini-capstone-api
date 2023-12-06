Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/products" => "products#index"
  get "/a_product" => "products#show"
  get"/products/:id" => "products#second"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "/products/:id" =>"products#destroy"
end
