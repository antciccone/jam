require 'rails_helper'

describe 'TopArtists' do
  context 'returns a users top artists' do
    it '.top_artists' do
      VCR.use_cassette("#users_top_artists") do
        user = User.create(token: ENV['USER_TOKEN'])

        top_artists = TopArtists.users_top_artists(user)

        expect(top_artists.first).to respond_to(:name)
        expect(top_artists).to respond_to(:geners)
        expect(top_artists).to respond_to(:geners)

      end
    end
  end
end
