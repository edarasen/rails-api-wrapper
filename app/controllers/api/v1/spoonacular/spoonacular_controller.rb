module Api::V1::Spoonacular
  class SpoonacularController < ApplicationController
    def get_random
      response = V1::Spoonacular::Client.random
      if response.success?
        render json: response.body
      else
        render json: { error: "Unable to retrieve random recipe", status: :service_unavailable }
      end
    end
    def get_diet_friendly
      diet = params[:diet]
      if diet.present?
        response = V1::Spoonacular::Client.diet_friendly(diet)
        render json: response.body
      else
        render json: { error: "No diet specified", status: :bad_request }
      end
    end
    def get_find_by_ingredients
      ingredients = params[:ingredients]
      if ingredients.present?
        response = V1::Spoonacular::Client.find_by_ingredients(ingredients)
        render json: response.body
      else
        render json: { error: "No ingredients selected, please specify at least one ingredient", status: :bad_request }
      end
    end
    def get_find_by_intolerances
    intolerances = params[:intolerances]
      if intolerances.present?
        response = V1::Spoonacular::Client.intolerances(intolerances)
        render json: response.body
      else
        render json: { error: "No intolerances selected, please specify at least one intolerances", status: :bad_request }
      end
    end
  end
end
