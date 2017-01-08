require 'rails_helper'

describe 'ArtistConcerts' do
  context 'returns a concerts for partiuclar artist' do
    it '.top_artists_concerts' do
      VCR.use_cassette('#ArtistConcerts') do

        artist = "Justin Bieber"
        lat = "40.7128"
        long = "-74.0059"

        concerts = ArtistConcerts.top_artists_concerts(artist, lat, long)

        expect(concerts.first).to respond_to(:date)
        expect(concerts.first).to respond_to(:title)
        expect(concerts.first).to respond_to(:city)
        expect(concerts.first).to respond_to(:ticket_link)
        expect(concerts.first).to respond_to(:venue_location)
        expect(concerts.first).to respond_to(:lat)
        expect(concerts.first).to respond_to(:long)
        expect(concerts.first.city).to eq("East Rutherford, NJ")
        expect(concerts.first.date).to eq("Wednesday, August 23, 2017 at 7:00PM")
        expect(concerts.first.lat).to eq(40.8139331)
        expect(concerts.first.long).to eq(-74.0744412)

      end
    end
  end
end
