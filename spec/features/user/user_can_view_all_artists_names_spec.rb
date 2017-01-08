require 'rails_helper'

describe 'As a user' do
  context 'when I login' do
    scenario 'I can see the artists ' do
      VCR.use_cassette('#artist_names') do

        visit "/"
        stub_omniauth
        click_button 'Login with Spotify'
        click_link 'Your Top Artists Concerts'

        expect(page).to have_content('Kanye West Concerts')
        expect(page).to have_content('Drake Concerts')
        expect(page).to have_content('Jon Bellion Concerts')
        expect(page).to have_content('Future Concerts')
        expect(page).to have_content('Rihanna Concerts')
        expect(page).to have_content('Justin Bieber Concerts')
        expect(page).to have_content('Dierks Bentley Concert')

      end
    end
  end
end
