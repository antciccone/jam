class AllConcerts

  attr_reader :title, :date, :city, :ticket_link, :venue_location, :name

  def initialize(service)
    @name           = service[:artists].first[:name]
    @title          = service[:title]
    @date           = service[:formatted_datetime]
    @city           = service[:formatted_location]
    @ticket_link    = service[:ticket_url]
    @venue_location = service[:venue]
  end

  def self.all_artist_concerts(artist)
    ArtistsService.new.all_concerts(artist).map do |raw_info|
      AllConcerts.new(raw_info)
    end
  end

end
