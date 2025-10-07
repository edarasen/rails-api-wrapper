module Api::V1::Spoonacular
  class SpoonacularController < ApplicationController
    def get_random
      response = V1::Spoonacular::Client.random
      if response.success?
        render json: response
      else
        render json: { error: "Unable to retrieve random recipe", status: :service_unavailable }
      end
    end
    def get_diet_friendly
      diet = params[:diet]
      if diet.present?
        response = V1::Spoonacular::Client.diet_friendly(diet)
        render json: response
      else
        render json: { error: "No diet specified", status: :bad_request }
      end
    end
  end
end
