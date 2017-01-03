class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:uid] = user.uid
    #user.refresh_token need to look info refresh_token
    redirect_to user_path
  end
end
