require 'rails_helper'


describe 'EmailService' do
  context 'sending an email' do
    it '.send_email' do
      VCR.use_cassette("#send-email") do

        email = EmailService.new.send_email("aciccone@bu.edu", "subject", "message")

        expect(email.status).to eq(202)
      end
    end
  end
end
