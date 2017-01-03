class SpotifyService

  def initialize
    @conn = Faraday.new(url: 'https://api.spotify.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
  end

  def top_artists(user)
    spotify_json = conn.get do |req|

      req.url '/v1/me/top/artists'
  end


  private

    attr_reader :conn

end
