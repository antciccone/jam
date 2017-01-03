class SpotifyService

  def initialize
    @conn = Faraday.new(url: 'https://api.spotify.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def top_artists(user)
    spotify_json = conn.get do |req|
      req.headers['Authorization'] = "Bearer #{user.token}"
      req.url '/v1/me/top/artists'
    end
    json_parse(spotify_json.body)[:items]
  end

  def json_parse(spotify_json)
    JSON.parse(spotify_json, symbolize_names: true)
  end

  private

    attr_reader :conn

end
