module V1::Spoonacular
  class Client
    def self.random
      response = Request.call("/random")
    end
    def self.diet_friendly(diet)
      tags = { "include-tags" => diet }
      response = Request.call("/random", tags)
    end
    def self.find_by_ingredients(ingredient_csv)
      options = { "ingredients" => ingredient_csv }
      response = Request.call("/findByIngredients", options)
    end
    def self.intolerances(intolerance_csv)
      options = { "intolerances" => intolerance_csv }
      response = Request.call("/complexSearch", options)
    end
  end
end
