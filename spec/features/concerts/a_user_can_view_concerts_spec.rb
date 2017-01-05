require 'rails_helper'

describe 'As a user' do
  context 'when I click on an artist' do
    scenario 'I can view recommended concerts' do
      VCR.use_cassette("#viewing_concerts") do
        visit "/"
        stub_omniauth

        click_button 'Login with Spotify'
        expect(current_path).to eq(user_path(User.last))

        click_link 'Drake'
        save_and_open_page
        expect(current_path).to eq(concerts_path)

      end
    end
  end
end
