class Api::V1::Private::PrivateController < ApplicationController

  before_filter :restrict_access
  before_filter :validate_params, only: :evaluate_target

  layout false

  def locations
    head :ok
  end

  def target_groups
    head :ok
  end

  def evaluate_target
    head :ok
  end

  private

  def validate_params
    errors = []
    required_params = %w(country_code target_group_id locations)
    errors << 'Not enough parameters' if (required_params - params.keys).any?
    errors << 'target_group_id parameter is not a valid integer' unless /\A\d+\z/.match(params[:target_group_id])
    errors << 'locations parameter is not a valid array' unless params[:locations].is_a? Array
    if errors
      render json: { errors: errors }, status: :bad_request and return
    end
  end

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiToken.exists?(token: token)
    end
  end

end
