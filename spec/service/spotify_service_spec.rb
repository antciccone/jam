require 'rails_helper'

describe 'SpotifyService' do
  context '#top_artists' do
    it 'returns an array of users top artists' do
      user = User.create(token: ENV['USER_TOKEN'])

      spotify_artists = SpotifyService.new
      spotify_artists.top_artists(user)

      expect(spotify_artists.class).to eq(Array)
    end
  end
end
