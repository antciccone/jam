require 'rails_helper'

describe 'SpotifyService' do
  context '#top_artists' do
    it 'returns an array of users top artists' do
      VCR.use_cassette("#spotify_service") do

        user = User.create(token: ENV['USER_TOKEN'])

        spotify_artists = SpotifyService.new

        expect(spotify_artists.top_artists(user).class).to eq(Array)
      end
    end
  end
end
