require 'rails_helper'

describe "As a user" do
  context "when I sign in" do
    scenario "I can view my top artists" do
      VCR.use_cassette('#login') do

        visit "/"
        stub_omniauth

        click_button 'Login with Spotify'
        click_link 'Your Top Artists Concerts'
        expect(page).to have_content('Kanye West')
        expect(current_path).to eq(top_artists_path)
      end
    end
  end
end
