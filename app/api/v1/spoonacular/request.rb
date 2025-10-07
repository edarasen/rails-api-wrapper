require "httparty"
module V1::Spoonacular
  class Request
    include HTTParty
    base_uri "https://api.spoonacular.com/recipes"
    def self.get_headers
      { "x-api-key" => ENV["SPOON_API_KEY"] }
    end
    def self.call(endpoint, options = {})
      headers = self.get_headers
      if !options.empty?
        get("#{endpoint}", headers: headers, query: options)
      else
        get("#{endpoint}", headers: headers)
      end
    end
  end
end
