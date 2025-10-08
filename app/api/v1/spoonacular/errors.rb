module V1::Spoonacular
  class Errors
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
