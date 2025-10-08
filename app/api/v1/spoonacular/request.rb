require "httparty"
module V1::Spoonacular
  class Request
    include HTTParty
    base_uri "https://api.spoonacular.com/recipes"
    def self.get_headers
      { "x-api-key" => ENV["SPOON_API_KEY"] }
    end
    def self.call(endpoint, options = {})
      begin
        response = {}
        headers = self.get_headers
        if !options.empty?
          response = get("#{endpoint}", headers: headers, query: options)
        else
          response = get("#{endpoint}", headers: headers)
        end
        if !response.success?
          response = { error: response.code, data: Errors.map(response.code) }
        end
        response
      rescue HTTParty::Error => e
        { error: e.message, status: :bad_request }
      rescue StandardError => e
        { error: e.message, status: :bad_gateway }
      end
    end
  end
end
