class Api::V1::PublicController < Api::V1::ApiController

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

end
