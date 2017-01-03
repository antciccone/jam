require 'rails_helper'

describe 'ArtistsService' do
  context '#artist_search' do
    it 'returns an array of concets for a given artists' do
      VCR.use_cassette('#bandsservice') do

        artists = "Kanye West"
        lag = "40.7128"
        long = "-74.0059"
        artists_service = ArtistsService.new.concerts(artists, lat, long)

        expect(artists_service.class).to eq(Array)
      end
    end
  end
end
