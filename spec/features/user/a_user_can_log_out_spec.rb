require 'rails_helper'


describe 'As a user' do
  context 'when I am logged in' do
    scenario 'I can log out' do
      VCR.use_casette("#logout") do
        visit "/"
        stub_omniauth

        click_button 'Login with Spotify'


      end
    end
  end
end
