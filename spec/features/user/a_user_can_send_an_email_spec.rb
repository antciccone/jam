require 'rails_helper'

describe 'As a user' do
  context 'when I am view a concert' do
    scenario 'I can send an email' do
      VCR.use_cassette("#email") do
        visit "/"
        stub_omniauth

        click_button 'Login with Spotify'
        click_link 'Your Top Artists Concerts'
        click_link 'Drake Concerts'

        fill_in :email, with: "aciccone@bu.edu"
        fill_in :subject, with: "test"
        fill_in :message, with: "testing"
        click_button "Send Email"

        expect(current_path).to eq(top_artists_path)
        expect(page).to have_content('You have sent an email')
      end
    end
  end
end
