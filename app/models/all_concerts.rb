class AllConcerts

  attr_reader :title, :date, :city, :ticket_link, :venue_location, :name, :image

  def initialize(service)
    @image          = service[:artists].first[:image_url]
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
