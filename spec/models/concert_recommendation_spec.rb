require 'rails_helper'

describe 'ConcertRecommendation' do
  context 'returns recommended concerts for a particular artist' do
    it '.artist_concert_recommendation' do
      VCR.use_cassette("#recommendation") do

        artist = "Lettuce"
        lat = "40.7128"
        long = "-74.0059"

        concert_rec = ConcertRecommendation.artist_concert_recommendation(artist, lat, long)

        expect(concert_rec.first).to respond_to(:date)
        expect(concert_rec.first).to respond_to(:title)
        expect(concert_rec.first).to respond_to(:city)
        expect(concert_rec.first).to respond_to(:ticket_link)
        expect(concert_rec.first).to respond_to(:venue_location)
        expect(concerts.first).to respond_to(:lat)
        expect(concerts.first).to respond_to(:long)
        expect(concert_rec.last.name).to eq("The Greyboy Allstars")
        expect(concert_rec.last.city).to eq("Brooklyn, NY")
        expect(concert_rec.last.date).to eq("Friday, April 21, 2017 at 8:00PM")
        expect(concert_rec.last.ticket_link).to eq("http://www.bandsintown.com/event/13489724/buy_tickets?app_id=jam&artist=The+Greyboy+Allstars&came_from=67")
      end
    end
  end
end
