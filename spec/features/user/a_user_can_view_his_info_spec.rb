require 'rails_helper'


describe "As a user" do
  context "when I sign in" do
    scenario "I am redirected to my user show page" do
      VCR.use_cassette('#login') do

        visit "/"
        stub_omniauth

        click_button 'Login with Spotify'

        expect(current_path).to eq(user_path(User.first.id))
        expect(page).to have_content("Cliff Nadaner")
        expect(page).to have_content("Nickname: cliff232")
        expect(page).to have_content("Followers: 2")
        expect(page).to have_content("Email: cnadaner@aol.com")
        expect(page).to have_link("Your Top Artists Concerts")
        expect(page).to have_link("Your Top Tracks")
      end
    end
  end
end
