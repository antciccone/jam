require 'rails_helper'

describe 'As a user' do
  context 'when I view an artists' do
    scenario 'I can see their concert dates' do
      VCR.use_cassette('#login') do

        visit "/"
        stub_omniauth

        click_button 'Login with Spotify'
        click_link 'Your Top Artists Concerts'
        ciick_link 'Drake Concerts'
      end
    end
  end
end
