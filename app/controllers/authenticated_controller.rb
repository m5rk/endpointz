class AuthenticatedController < ApplicationController
  before_action :authenticate_user!

  def current_user
    authenticate_api_request.result
  end

private
  def authenticate_api_request
    @authenticate_api_request ||= AuthenticateApiRequest.call(request.headers)
  end

  def authenticate_user!
    head :unauthorized unless current_user
  end
end
