class EmailController < ApplicationController


  def sent
    email = EmailService.new.send_email(params[:email], params[:subject], params[:message])

    redirect_to top_artists_path
  end
end
