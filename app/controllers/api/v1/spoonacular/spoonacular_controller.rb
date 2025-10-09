module Api::V1::Spoonacular
  class SpoonacularController < ApplicationController
    # Natural Query Recipe Search
    # @param query [String] a natural language query ex. pasta
    def get_natural_query
      query = params[:query]
      # If query parameter is not present in the route, return an error hash
      if query.present?
        response = V1::Spoonacular::Client.natural_query(query)
        render json: response.body
      else
        render json: { error: "No query specified", status: :bad_request }
      end
    end

    # Recipe Info by Recipe ID
    # @param id [Integer] the id of the recipe
    def get_recipe_info
      id = params[:id]
      # If id parameter is not present in the route, return an error hash
      if id.present?
        response = V1::Spoonacular::Client.recipe_info(id)
        render json: response.body
      else
        render json: { error: "No id specified", status: :bad_request }
      end
    end

    # Nutrition Info by Recipe ID
    # @param id [Integer] the id of the recipe
    def get_nutrition_info
      id = params[:id]
      # If id parameter is not present in the route, return an error hash
      if id.present?
        response = V1::Spoonacular::Client.nutrition_info(id)
        render json: response.body
      else
        render json: { error: "No id specified", status: :bad_request }
      end
    end

    # Similar Recipes by Recipe ID
    # @param id [Integer] the id of the recipe
    # @param number [Integer] the id of the recipe
    def get_similar_recipes
      id = params[:id]
      number = params[:number]
      # If id or number parameter is not present in the route, return an error hash
      if id.present? && number.present?
        response = V1::Spoonacular::Client.similar_recipes(id, number)
        render json: response.body
      else
        response = V1::Spoonacular::Client.similar_recipes(id)
      end
    end

    # Random Recipe
    # @param include_tags [String] The tags (can be diets, meal types, cuisines, or intolerances) that the recipe must have, separated by commas (ex. vegetarian,dessert,chinese)
    # @param exclude_tags [String] The tags (can be diets, meal types, cuisines, or intolerances) that the recipe must not have, separated by commas (ex. vegetarian,dessert,chinese)
    def get_random
      include_tags = params[:include_tags]
      exclude_tags = params[:exclude_tags]
      # If include_tags or exclude_tags parameter is present in the route, add options to the http query
      if include_tags.present? || exclude_tags.present?
        response = V1::Spoonacular::Client.random(include_tags, exclude_tags)
        render json: response.body
      else
        response = V1::Spoonacular::Client.random
        render json: response.body
      end
    end

    # Search Recipe by Ingredient
    # @param include_tags [String] A comma-separated list of ingredients that the recipes should contain.
    def get_find_by_ingredients
      ingredients = params[:ingredients]
      # If ingredients parameter is not present in the route, return an error hash
      if ingredients.present?
        response = V1::Spoonacular::Client.find_by_ingredients(ingredients)
        render json: response.body
      else
        render json: { error: "No ingredients selected, please specify at least one ingredient", status: :bad_request }
      end
    end
    
    # Error Test
    # Method to test error handling by using an API endpoint that does not exist
    def error_test
      response = V1::Spoonacular::Client.error_test
      render json: response
    end
  end
end
