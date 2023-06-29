Rails.application.routes.draw do

  namespace :v1 do
    get "/", to: "v1#index"
    resources :clientes
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
