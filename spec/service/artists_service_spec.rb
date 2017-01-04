require 'rails_helper'

describe 'ArtistsService' do
  context '#artist_search' do
    it 'returns an array of concets for a given artists' do
      VCR.use_cassette('#bandsservice') do

        artists = "Lettuce"
        lat = "40.7128"
        long = "-74.0059"

        artists_service = ArtistsService.new.concerts(artists, lat, long)

        expect(artists_service.class).to eq(Array)
        expect(artists_service.first).to have_key(:formatted_datetime)
        expect(artists_service.first).to have_key(:formatted_location)
        expect(artists_service.first).to have_key(:ticket_url)
        expect(artists_service.first).to have_key(:venue)
        expect(artists_service.first[:title].class).to eq(String)
      end
    end
  end
    context 'returns recommned concerts for partiuclar artists' do
      it '.recommended_concerts' do
        VCR.use_cassette('#bandsservicerec') do

        artists = "Lettuce"
        lat = "40.7128"
        long = "-74.0059"

        recommended_concerts = ArtistsService.new.recommended_concerts(artists, lat, long)

        expect(recommended_concerts.class).to eq(Array)
        expect(recommended_concerts.first).to have_key(:formatted_datetime)
        expect(recommended_concerts.first).to have_key(:formatted_location)
        expect(recommended_concerts.first).to have_key(:ticket_url)
        expect(recommended_concerts.first).to have_key(:venue)
        expect(recommended_concerts.first[:title].class).to eq(String)
      end
    end
  end

  context 'returns all concerts for partiuclar artists' do
    it '.all_artists_concerts' do
        VCR.use_cassette('#bandsserviceallshows') do

        artist = "Drake"

        all_concerts = ArtistsService.new.all_concerts(artist)

        expect(all_concerts.class).to eq(Array)
        expect(all_concerts.first).to have_key(:formatted_datetime)
        expect(all_concerts.first).to have_key(:formatted_location)
        expect(all_concerts.first).to have_key(:ticket_url)
        expect(all_concerts.first).to have_key(:venue)
        expect(all_concerts.first[:title].class).to eq(String)
      end
    end
  end
end
