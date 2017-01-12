require 'rails_helper'


describe 'EmailService' do
  context 'sending an email' do
    xit '.send_email' do
      VCR.turned_off do
        WebMock.allow_net_connect!

        email = EmailService.new.send_email("aciccone@bu.edu", "subject", "message")

        expect(email.status).to eq(202)
      end
    end
  end
end
