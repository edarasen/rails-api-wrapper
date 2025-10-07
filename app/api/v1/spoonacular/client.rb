module V1::Spoonacular
  class Client
    def self.random
      response = Request.call("/random")
    end
    def self.diet_friendly(diet)
      tags = { "include-tags" => diet }
      response = Request.call("/random", tags)
    end
  end
end
