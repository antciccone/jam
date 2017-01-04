require 'rails_helper'


describe 'ArtistConcerts' do
  context 'returns a concerts for partiuclar artist' do
    it '.top_artists_concerts' do
      VCR.use_cassette('#ArtistConcerts') do

        artist = "Lettuce"
        lat = "40.7128"
        long = "-74.0059"

        concerts = ArtistConcerts.top_artists_concerts(artist, lat, long)

        expect(concerts.first).to respond_to(:date)
        expect(concerts.first).to respond_to(:title)
        expect(concerts.first).to respond_to(:city)
        expect(concerts.first).to respond_to(:ticket_link)
        expect(concerts.first).to respond_to(:venue_location)
        expect(concerts.first.city).to eq("Brooklyn, NY")
        expect(concerts.first.date).to eq("Tuesday, January 3, 2017 at 8:00PM")
        expect(concerts.first.ticket_link).to eq("http://www.bandsintown.com/event/13298041/buy_tickets?app_id=jam&artist=Lettuce&came_from=67")
      end
    end
  end
end
