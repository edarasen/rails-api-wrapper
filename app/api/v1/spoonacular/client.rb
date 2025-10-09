module V1::Spoonacular
  class Client
    # Natural Query Recipe Search
    # Wraps this : https://spoonacular.com/food-api/docs#Search-Recipes-Complex
    # @param query [String] a natural language query ex. pasta
    # @return response [Hash] fetch response from api
    def self.natural_query(query)
      # options hash contains prameters to be passed in the http request
      options = { "query" => query }
      response = Request.call("/complexSearch", options)
    end

    # Recipe Info by Recipe ID
    # Wraps this : https://spoonacular.com/food-api/docs#Get-Recipe-Information
    # @param id [Integer] the id of the recipe
    # @return response [Hash] fetch response from api
    def self.recipe_info(id)
      response = Request.call("/#{id}/information")
    end

    # Nutrition Info by Recipe ID
    # Wraps this : https://spoonacular.com/food-api/docs#Nutrition-by-ID
    # @param id [Integer] the id of the recipe
    # @return response [Hash] fetch response from api
    def self.nutrition_info(id)
      response = Request.call("/#{id}/nutritionWidget.json")
    end

    # Similar Recipes by Recipe ID
    # Wraps this : https://spoonacular.com/food-api/docs#Get-Similar-Recipes
    # @param id [Integer] the id of the recipe
    # @param number [Integer] the id of the recipe
    # @return response [Hash] fetch response from api
    def self.similar_recipes(id, number = 1)
      # options hash contains prameters to be passed in the http request
      options = { "number" => number }
      response = Request.call("/#{id}/similar", options)
    end

    # Random Recipe
    # Wraps this : https://spoonacular.com/food-api/docs#Get-Random-Recipes
    # @param include_tags [String] The tags (can be diets, meal types, cuisines, or intolerances) that the recipe must have, separated by commas (ex. vegetarian,dessert,chinese)
    # @param exclude_tags [String] The tags (can be diets, meal types, cuisines, or intolerances) that the recipe must not have, separated by commas (ex. vegetarian,dessert,chinese)
    # @return response [Hash] fetch response from api
    def self.random(include_tags = {}, exclude_tags = {})
    # options hash contains prameters to be passed in the http request
      options = { "include-tags" => include_tags, "exclude-tags" => exclude_tags }
      response = Request.call("/random", options)
    end

    # Search Recipe by Ingredient
    # Wraps this : https://spoonacular.com/food-api/docs#Search-Recipes-by-Ingredients
    # @param include_tags [String] A comma-separated list of ingredients that the recipes should contain.
    # @return response [Hash] fetch response from api
    def self.find_by_ingredients(ingredient_csv)
      # options hash contains prameters to be passed in the http request
      options = { "ingredients" => ingredient_csv }
      response = Request.call("/findByIngredients", options)
    end

    # Error Test
    # Method to test error handling by using an API endpoint that does not exist
    # @return response [Hash] fetch response from api
    def self.error_test
      response = Request.call("/non-endpoint")
    end
  end
end
