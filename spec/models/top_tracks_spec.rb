require 'rails_helper'


describe 'TopTracks' do
  context 'returns users top tracks' do
    it '.user_top_tracks' do
        VCR.use_cassette('#top_tracks') do
        user = User.create(token: ENV['USER_TOKEN'])

        top_tracks = TopTracks.user_top_tracks(user)

        expect(top_tracks.first).to respond_to(:uri)
        expect(top_tracks.first).to respond_to(:name)
        expect(top_tracks.first.name).to eq("Closer")
        expect(top_tracks.first.uri).to eq("spotify:track:7BKLCZ1jbUBVqRi2FVlTVw")
      end
    end

  end
end
