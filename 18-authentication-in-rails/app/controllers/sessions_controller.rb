class SessionsController < ApplicationController

  def new
    redirect_to root_url if logged_in?
  end

  def create
    byebug
    user = User.find_or_create_by_auth_hash(auth_hash)
    self.current_user = user
    redirect_to root_url
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

end
