module V1::Spoonacular
  class Client
    def self.natural_query(query)
      options = { "query" => query }
      response = Request.call("/complexSearch", options)
    end
    def self.recipe_info(id)
      response = Request.call("/#{id}/information")
    end
    def self.nutrition_info(id)
      response = Request.call("/#{id}/nutritionWidget.json")
    end
    def self.similar_recipes(id, number = 1)
      options = { "number" => number }
      response = Request.call("/#{id}/similar", options)
    end
    def self.random(include_tags = {}, exclude_tags = {})
      options = { "include-tags" => include_tags, "exclude-tags" => exclude_tags }
      response = Request.call("/random", options)
    end
    def self.find_by_ingredients(ingredient_csv)
      options = { "ingredients" => ingredient_csv }
      response = Request.call("/findByIngredients", options)
    end
    def self.error_test
      response = Request.call("/non-endpoint")
    end
  end
end
