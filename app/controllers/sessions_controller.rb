class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(request.env["omniauth.auth"], location)
    session[:uid] = user.uid
    user.user_refresh_token
    #user.geocode
    redirect_to user_path(user)
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
