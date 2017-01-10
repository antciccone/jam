class EmailService


  def send_email(email, subject, message)
    data  = {"personalizations": [{"to": [{"email": "#{email}"}]}],"from": {"email": "aciccone2014@gmail.com"},"subject": "#{subject}","content": [{"type": "text/plain", "value": "#{message}!"}]}
    data_json = JSON.generate(data)
    email_json = Faraday.new("https://api.sendgrid.com/v3/mail/send").post do |req|
      req.headers['Authorization'] = "Bearer #{ENV['SENDGRID_API_KEY']}"
      req.headers['Content-Type'] = "application/json"
      req.body = data_json
    end
    email_json
  end
end
