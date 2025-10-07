Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  namespace :api do
    namespace :v1 do
      namespace :spoonacular do
        get "/random", to: "spoonacular#get_random"
        get "/diet/:diet", to: "spoonacular#get_diet_friendly"
        get "/findByIngredients/:ingredients", to: "spoonacular#get_find_by_ingredients"
        get "/intolerances/:intolerances", to: "spoonacular#get_find_by_intolerances"
      end
    end
  end
end
