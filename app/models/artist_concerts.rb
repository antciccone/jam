class ArtistConcerts

  def self.top_artists_concerts(artist, lat, long)
    ArtistsService.new(artist, lat, long).map do |ra
  end

end
