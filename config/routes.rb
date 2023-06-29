Rails.application.routes.draw do

  namespace :v1 do
    get "/", to: "changlog#index"
    resources :clientes
  end

  namespace :v2 do
    get "/", to: "changlog#index"

    get "/clientes", to: "clientes#index"
    post "/clientes", to: "clientes#create"
    get "/clientes/:id", to: "clientes#show"
    delete "/clientes/:id", to: "clientes#destroy"
    put "/clientes/:id", to: "clientes#update"
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
