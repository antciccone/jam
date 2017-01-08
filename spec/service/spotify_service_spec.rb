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

  context 'returns a users top tracks' do
    it "#top_tracks" do
      VCR.use_cassette("#top_tracks") do

        user = User.create(token: ENV['USER_TOKEN'])

        spotify_tracks = SpotifyService.new.top_tracks(user)

        expect(spotify_tracks.class).to eq(Array)
        expect(spotify_tracks.first).to have_key(:album)
        expect(spotify_tracks.first).to have_key(:uri)
      end
    end
  end


    context 'returns a users top tracks' do
      it "#top_categories" do
        VCR.use_cassette("#categories") do

          user = User.create(token: ENV['USER_TOKEN'])

          categories = SpotifyService.new.top_categories(user)

          expect(categories.class).to eq(Array)
          expect(categories.first).to have_key(:name)
          expect(categories.first[:name].class).to eq(String)
        end
      end
    end

  context 'a user can update their token' do
    xit 'update_token' do
        VCR.use_cassette("#update_token") do
        user = stub_omniauth

        expect(response.status).to eq(200)
      end
    end
  end
end
