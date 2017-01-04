require 'rails_helper'


describe 'ArtistConcerts' do
  context 'returns a concerts for partiuclar artist' do
    it '.top_artists_concerts' do
      VCR.use_cassette('#ArtistConcerts') do

        artists = "Lettuce"
        lat = "40.7128"
        long = "-74.0059"

        concerts = ArtistConcerts.top_artists_concerts(artists, lat, long)

        expect(concerts.first).to respond_to(:formatted_datetime)
        expect(concerts.first).to respond_to(:formatted_location)
        expect(concerts.first).to respond_to(:formatted_datetime)
        expect(concerts.first).to respond_to(:ticket_url)
        expect(concerts.first).to respond_to(:venue)
      end
    end
  end
end
