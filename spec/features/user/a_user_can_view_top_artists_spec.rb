require 'rails_helper'


describe "As a user" do
  context "when I sign in" do
    scenario "I am redirected to user page and can view my top artists" do
      VCR.use_cassette('#login') do

        visit "/"
        stub_omniauth
        save_and_open_page
        expect(page.status_code).to eq(200)
        expect(current_path).to eq(user_path)
      end
    end
  end
end
