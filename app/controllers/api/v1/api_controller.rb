class Api::V1::ApiController < ApplicationController

  private

  def require_params(required_params)
    if (required_params - params.keys).any?
      render json: { errors: 'Not enough parameters' }, status: :bad_request and return
    end
  end


end
