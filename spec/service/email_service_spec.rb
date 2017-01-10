require 'rails_helper'


describe 'EmailService' do
  context 'retuns email' do
    it '.email_sender' do
      VCR.turned_off do
        WebMock.allow_net_connect!

        email = EmailService.email_sender

        expect(email).to eq(Hash)
      end
    end
  end
end
