module V1::Spoonacular
  class Errors
    def self.map(code)
      case code
      when 404
        return "Not Found"
      when 401
        return "Unauthorized"
      else
        return "Try Again"
      end
    end
  end
end