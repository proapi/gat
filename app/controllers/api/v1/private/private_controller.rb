class Api::V1::Private::PrivateController < ApplicationController

  before_filter :restrict_access

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

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiToken.exists?(token: token)
    end
  end

end
