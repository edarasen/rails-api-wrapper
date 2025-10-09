require "httparty"
module V1::Spoonacular
  class Request
    include HTTParty
    base_uri "https://api.spoonacular.com/recipes"

    # Sets api key in headers with the key "x-api-key"
    # @return a header hash for use in the http request
    def self.get_headers
      { "x-api-key" => ENV["SPOON_API_KEY"] }
    end

    # Fetches from the api
    # @param endpoint [String] the endpoint for api fetching
    # @param options [Hash] the extra parameters needed for api fetching
    # @return response [Hash] fetch response from api or an error hash if the response code is not 200
    def self.call(endpoint, options = {})
        # Set api key with headers
        headers = self.get_headers
        # If options is not empty, set the hash as query in the HTTParty call
        if !options.empty?
          response = get("#{endpoint}", headers: headers, query: options)
        else
          response = get("#{endpoint}", headers: headers)
        end
        # Check if the response code is 200, else raise an error
        if !response.success?
          raise HTTParty::Error.new(response.code)
        end
        response
      rescue HTTParty::Error => e
        # Error hash that has a custom status based on the Errors.map method
        { error: e.message, status: Errors.map(e.message.to_i) }
    end
  end
end
