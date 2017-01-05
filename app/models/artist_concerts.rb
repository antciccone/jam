class ArtistConcerts

  attr_reader :title, :date, :city, :ticket_link, :venue_location, :image, :name, :lat, :long

  def initialize(service)
    @image          = service[:artists].first[:image_url]
    @name           = service[:artists].first[:name]
    @title          = service[:title]
    @date           = service[:formatted_datetime]
    @city           = service[:formatted_location]
    @ticket_link    = service[:ticket_url]
    @venue_location = service[:venue]
    @lat            = service[:venue][:latitude]
    @long            = service[:venue][:longitude]
  end

  def self.top_artists_concerts(artist, lat, long)
    ArtistsService.new.concerts(artist, lat, long).map do |raw_info|
      ArtistConcerts.new(raw_info)
    end
  end

  def month
    date.split.first.delete(",")
  end

  def day_number
    date.split[2].delete(",")
  end

  def day
    date.split[1].delete(",")
  end

  def year
    date.split[3].delete(",")
  end

  def time
    date.split.last.delete(",")
  end

  def format_venue
    title.split('@').last
  end

end
