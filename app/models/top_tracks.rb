class TopTracks

  attr_reader :uri, :name
  def initialize(service)
    @uri = service[:uri]
    @name = service[:name]
  end

  def self.user_top_tracks(user)
    SpotifyService.new.top_tracks(user).map do |raw_info|
      TopTracks.new(raw_info)
    end
  end
end
