require 'rails_helper'

describe 'SpotifyService' do
  context 'returns an array of users top artists' do
    it "#top_artists" do
      VCR.use_cassette("#spotify_service") do

        user = User.create(token: ENV['USER_TOKEN'])

        spotify_artists = SpotifyService.new.top_artists(user)

        expect(spotify_artists.class).to eq(Array)
        expect(spotify_artists.first).to have_key(:genres)
        expect(spotify_artists.first).to have_key(:images)
        expect(spotify_artists.first).to have_key(:name)
        expect(spotify_artists.first[:name]).to eq('Kanye West')
      end
    end
  end
end
