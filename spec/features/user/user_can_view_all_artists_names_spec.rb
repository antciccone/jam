require 'rails_helper'

describe 'As a user' do
  context 'when I login' do
    scenario 'I can see the artists ' do
      VCR.use_cassette('#artist_names') do

        visit "/"
        stub_omniauth
        click_button 'Login with Spotify'

        expect(page).to have_content('Kanye West')
        expect(page).to have_content('Drake')
        expect(page).to have_content('Jon Bellion')
        expect(page).to have_content('Sam Hunt')
        expect(page).to have_content('Future')
        expect(page).to have_content('Rihanna')
        expect(page).to have_content('Justin Bieber')
      end
    end
  end
end
