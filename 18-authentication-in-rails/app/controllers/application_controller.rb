class ApplicationController < ActionController::Base
  helper_method :current_user

  def hello
    redirect_to login_url unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def current_user=(user)
    session[:user_id] = user.id
    @current_user = user
  end
end
