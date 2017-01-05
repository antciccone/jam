require 'rails_helper'

describe 'As a user' do
  context 'when I click on an artist and that artists has no concerts within 150 miles of me' do
    scenario 'I can view recommended concerts' do
      VCR.use_cassette("#concet_location") do
        visit "/"
        stub_omniauth

        click_button 'Login with Spotify'
        User.last.update(latitude: 40.7128)
        User.last.update(longitude: 74.0059)

        expect(current_path).to eq(user_path(User.last))
        click_link 'Drake'

        expect(current_path).to eq(concerts_path)
        expect(page).to have_content("There are no concerts for Drake in your area")
      end
    end
  end

    scenario 'I can view recommended concerts' do
      VCR.use_cassette("#viewing_concerts") do
      visit "/"
      stub_omniauth

      click_button 'Login with Spotify'
      expect(current_path).to eq(user_path(User.last))

      click_link 'Drake'

      expect(current_path).to eq(concerts_path)
      expect(page).to have_content("Concert Reccomendations")
    end
  end
end
