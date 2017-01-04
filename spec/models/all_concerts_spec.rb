require 'rails_helper'

describe 'AllConcerts' do
  context 'returns all concerts for particular artist' do
    it '.all_artist_concerts' do
      VCR.use_cassette("#AllConcerts") do

        artist = "Drake"

        concert_rec = AllConcerts.all_artist_concerts(artist)

        expect(concert_rec.first).to respond_to(:date)
        expect(concert_rec.first).to respond_to(:title)
        expect(concert_rec.first).to respond_to(:city)
        expect(concert_rec.first).to respond_to(:ticket_link)
        expect(concert_rec.first).to respond_to(:venue_location)
        expect(concert_rec.last.name).to eq("Drake")
        expect(concert_rec.last.city).to eq("Cologne, Germany")
        expect(concert_rec.last.date).to eq("Thursday, March 16, 2017 at 8:00PM")
        expect(concert_rec.last.ticket_link).to eq("http://www.bandsintown.com/event/13105444/buy_tickets?app_id=jam&artist=Drake&came_from=67")
      end
    end
  end
end
