class EmailController < ApplicationController


  def sent
    email = EmailService.new.send_email(params[:email], params[:subject], params[:message])
    flash[:success] = "You have sent an email"
    redirect_to top_artists_path
  end
end
