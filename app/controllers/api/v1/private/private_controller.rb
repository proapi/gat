class Api::V1::Private::PrivateController < Api::V1::ApiController

  before_filter :restrict_access
  before_filter :validate_params, only: :evaluate_target

  layout false

  def locations
    require_params %w(country_code)

    country = Country.find_by_country_code params[:country_code]
    if country && country.locations
      render json: country.locations
    else
      head :not_found
    end
  end

  def target_groups
    require_params %w(country_code)

    country = Country.find_by_country_code params[:country_code]
    if country && country.target_groups
      render json: country.target_groups
    else
      head :not_found
    end
  end

  def evaluate_target
    require_params %w(country_code target_group_id locations)
    country = Country.find_by_country_code params[:country_code]
    if country && country.panel_provider
      render json: { price: country.panel_provider.price }
    else
      head :not_found
    end
  end

  private

  def validate_params
    errors = []
    errors << 'target_group_id parameter is not a valid integer' unless /\A\d+\z/.match(params[:target_group_id])
    errors << 'locations parameter is not a valid array' unless params[:locations].is_a? Array
    if errors.any?
      render json: { errors: errors }, status: :bad_request and return
    end
  end

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiToken.exists?(token: token)
    end
  end

end
