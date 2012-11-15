class ApplicationController < ActionController::Base
  protect_from_forgery
before_filter :authorize, only: [ :delete]
# before_filter :return_page, except: [:new]

private
def current_user
  @current_user ||= User.find_by_auth_token( cookies[:auth_token]) if cookies[:auth_token]
end

def authorize
	redirect_to new_session_path, alert: "You have to log in to access to this page" if current_user.nil?
end

# def return_page
# 	session[:protected_page] = request.fullpath
# end
  helper_method :current_user
end
