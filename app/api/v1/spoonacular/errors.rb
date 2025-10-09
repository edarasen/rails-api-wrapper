module V1::Spoonacular
  class Errors
    # Maps the error code to a string
    # @param code [Integer] http code to be checked
    # @return string depending on code
    def self.map(code)
      case code
      when 404
        "Not Found"
      when 401
        "Unauthorized"
      else
        "Try Again"
      end
    end
  end
end
