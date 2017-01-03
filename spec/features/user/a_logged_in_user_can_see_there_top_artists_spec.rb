require 'rails_helper'

describe "As a user" do
  context "when I sign in" do
    scenario "I can view my top artists" do
      VCR.use_cassette('#login') do

        visit "/"
        stub_omniauth

        click_link 'Login with Spotify'

        expect(page).to have_content('Kanye West')
      end
    end
  end
end
