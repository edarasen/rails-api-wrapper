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
          response = get("#{endpoint}", headers: headers, query: options)
        else
          response = get("#{endpoint}", headers: headers)
        end
        if !response.success?
          raise HTTParty::Error.new(response.code)
        end
        response
      rescue HTTParty::Error => e
        { error: e.message, status: Errors.map(e.message.to_i) }
    end
  end
end
