class ApplicationController < ActionController::API
private
  def current_user
    @current_user ||= User.find_by(api_token: params[:api_token])
  end


  def required_user
    if !current_user
      render json: ["You must be logged in"]
    end
  end
end
