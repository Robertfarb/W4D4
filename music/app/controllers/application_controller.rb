class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout_user(user)

  end

end
