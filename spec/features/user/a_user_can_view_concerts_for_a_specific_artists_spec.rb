require 'rails_helper'

describe 'As a user' do
  context 'when i click on an artists' do
    scenario 'I can see the artists concerts' do
      VCR.use_cassette('#login') do

        visit "/"
        stub_omniauth

        click_link 'Login with Spotify'
        click_on "Jon Bellion"
      end
    end
  end
end
