class TopArtists

  attr_reader :name, :genres, :images
  def initialize(service)
    @name   = service[:name]
    @genres = service[:genres]
    @images = service[:images]
  end

  def self.users_top_artists(user)
    SpotifyService.new.top_artists(user).map do |raw_info|
      TopArtists.new(raw_info)
    end
  end

  def self.one_artist(name)
    require "pry"; binding.pry
  end

end
