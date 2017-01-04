class ArtistConcerts

  attr_reader :title, :date, :city, :ticket_link, :venue_location

  def initialize(service)
    @title          = service[:title]
    @date           = service[:formatted_datetime]
    @city           = service[:formatted_location]
    @ticket_link    = service[:ticket_url]
    @venue_location = service[:venue]
  end

  def self.top_artists_concerts(artist, lat, long)
    ArtistsService.new.concerts(artist, lat, long).map do |raw_info|
      ArtistConcerts.new(raw_info)
    end
  end

end
