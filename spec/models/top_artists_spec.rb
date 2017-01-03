require 'rails_helper'

describe 'TopArtists' do
  context 'returns a users top artists' do
    it '.users_top_artists' do
      VCR.use_cassette("#users_top_artists") do
        user = User.create(token: ENV['USER_TOKEN'])

        top_artists = TopArtists.users_top_artists(user)

        expect(top_artists.first).to respond_to(:name)
        expect(top_artists.first).to respond_to(:images)
        expect(top_artists.first).to respond_to(:genres)
        expect(top_artists.second.name).to eq("Drake")
        expect(top_artists.second.genres.class).to eq(Array)
        expect(top_artists.second.images.class).to eq(Array)
      end
    end
  end
end
