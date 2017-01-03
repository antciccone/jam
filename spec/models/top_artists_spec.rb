require 'rails_helper'

describe 'TopArtists' do
  context 'returns a users top artists' do
    it '.top_artists' do
      VCR.use_cassette("#users_top_artists") do
        user = User.create(token: ENV['USER_TOKEN'])

        top_artists = TopArtists.users_top_artists

        expect(artists).to respond_to(:name)
        expect(artists).to respond_to(:geners)
      end
    end
  end
end
