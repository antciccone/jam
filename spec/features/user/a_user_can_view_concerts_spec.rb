require 'rails_helper'

describe 'As a user' do
  context 'when I view an artists' do
    scenario 'I can see their concert dates' do
      VCR.use_cassette('#view_concerts') do

        visit "/"
        stub_omniauth

        click_button 'Login with Spotify'
        click_link 'Your Top Artists Concerts'
        click_link 'Drake Concerts'

        expect(page).to have_content 'All Drake Concerts'
        expect(page).to have_content 'Date'
        expect(page).to have_content 'Artist'
        expect(page).to have_content 'Venue'
        expect(page).to have_content 'City'
        expect(page).to have_content 'Send Email'
        expect(page).to have_content 'Ticket Link'
      end
    end
  end
end
