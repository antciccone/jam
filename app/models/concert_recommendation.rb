class ConcertRecommendation

  attr_reader :title, :date, :city, :ticket_link, :venue_location, :name

  def initialize(service)
    @name           = service[:artists].first[:name]
    @title          = service[:title]
    @date           = service[:formatted_datetime]
    @city           = service[:formatted_location]
    @ticket_link    = service[:ticket_url]
    @venue_location = service[:venue]
  end

  def self.artist_concert_recommendation(artist, lat, long)
    ArtistsService.new.recommended_concerts(artist, lat, long).map do |raw_info|
      ConcertRecommendation.new(raw_info)
    end
  end

end
