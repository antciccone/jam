require 'rails_helper'

describe 'ConcertRecommendation' do
  context 'returns recommended concerts for a particular artist' do
    it '.artist_concert_recommendation' do
      VCR.use_cassette("#recommendation") do

        

      end
    end
  end
end
