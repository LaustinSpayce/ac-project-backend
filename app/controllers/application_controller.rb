class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  private

  # def current_user
  #   token = request.headers["Authorization"].to_s
  #   User.find_for_database_authentication(authentication_token: token)
  # end
end
