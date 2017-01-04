require 'rails_helper'

describe "As a user" do
  context "when I sign in" do
    scenario "I can view my top artists" do
      VCR.use_cassette('#login') do

        visit "/"
        stub_omniauth

        click_button 'Login with Spotify'

        expect(page).to have_content('Kanye West')
        expect(current_path).to eq(user_path(User.first))
      end
    end
  end
end
