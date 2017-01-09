class TopAlbums
  attr_reader :uri, :name
  def initialize(service)
    @uri = service[:album][:uri]
  end

  def self.users_top_albums(user)
    SpotifyService.new.top_albums(user).map do |raw_info|
      TopAlbums.new(raw_info)
    end
  end
end
