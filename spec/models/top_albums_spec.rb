require 'rails_helper'

describe 'TopAlbums' do
  context 'returns users top tracks' do
    it '.user_top_albums' do
        VCR.use_cassette('#top_albums') do
        user = User.create(token: ENV['USER_TOKEN'])

        top_albums = TopAlbums.users_top_albums(user)

        expect(top_albums.first).to respond_to(:uri)
        expect(top_albums.first.uri).to eq("spotify:album:4QJKyqHqUUBWEGYD7wekvU")
      end
    end
  end
end
