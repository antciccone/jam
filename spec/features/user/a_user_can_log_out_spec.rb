require 'rails_helper'


describe 'As a user' do
  context 'when I am logged in' do
    scenario 'I can log out' do
      VCR.use_cassette("#logout") do
        visit "/"
        stub_omniauth

        click_button 'Login with Spotify'
        expect(current_path).to eq(user_path(User.last))

        click_button 'Logout'
        expect(current_path).to eq(root_path)
      end
    end
  end
end
