require 'rails_helper'


describe "As a user" do
  context "when I sign in" do
    scenario "I am redirected to my user show page" do
      VCR.use_cassette('#login') do

        visit "/"
        stub_omniauth

        click_link 'Login with Spotify'

        expect(page.status_code).to eq(200)
        expect(current_path).to eq(user_path(User.first.id))
      end
    end
  end
end
