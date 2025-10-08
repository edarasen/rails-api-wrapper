module Api::V1::Spoonacular
  class SpoonacularController < ApplicationController
    def get_natural_query
      query = params[:query]
      if query.present?
        response = V1::Spoonacular::Client.natural_query(query)
        render json: response.body
      else
        render json: { error: "No query specified", status: :bad_request }
      end
    end
    def get_recipe_info
      id = params[:id]
      if id.present?
        response = V1::Spoonacular::Client.recipe_info(id)
        render json: response.body
      else
        render json: { error: "No id specified", status: :bad_request }
      end
    end
    def get_nutrition_info
      id = params[:id]
      if id.present?
        response = V1::Spoonacular::Client.nutrition_info(id)
        render json: response.body
      else
        render json: { error: "No id specified", status: :bad_request }
      end
    end
    def get_similar_recipes
      id = params[:id]
      number = params[:number]
      if number.present?
        response = V1::Spoonacular::Client.similar_recipes(id, number)
        render json: response.body
      else
        response = V1::Spoonacular::Client.similar_recipes(id)
      end
    end
    def get_random
      include_tags = params[:include_tags]
      exclude_tags = params[:exclude_tags]
      if include_tags.present? || exclude_tags.present?
        response = V1::Spoonacular::Client.random(include_tags, exclude_tags)
        render json: response.body
      else
        response = V1::Spoonacular::Client.random
        render json: response.body
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
    def error_test
      response = V1::Spoonacular::Client.error_test
      render json: response
    end
  end
end
