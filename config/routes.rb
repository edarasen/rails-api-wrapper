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
        get "/search/:query", to: "spoonacular#get_natural_query"
        get "/recipe/:id", to: "spoonacular#get_recipe_info"
        get "/recipe/:id/similar/:number", to: "spoonacular#get_similar_recipes"
        get "/nutrition/:id", to: "spoonacular#get_nutrition_info"
        get "/random", to: "spoonacular#get_random"
        get "/random/i/:include_tags", to: "spoonacular#get_random"
        get "/random/e/:exclude_tags", to: "spoonacular#get_random"
        get "/random/i/:include_tags/e/:exclude_tags", to: "spoonacular#get_random"
        get "/findByIngredients/:ingredients", to: "spoonacular#get_find_by_ingredients"
        get "/error-test", to: "spoonacular#error_test"
      end
    end
  end
end
