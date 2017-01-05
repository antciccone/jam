class SpotifyService

  def initialize
    @conn = Faraday.new(url: 'https://api.spotify.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
    @api_key = ENV['SPOTIFY_CLIENT_ID']
    @secert_key  = ENV['SPOTIFY_CLIENT_SECRET']
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

  def update_token(user)
    enigma = Base64.strict_encode64("#{api_key}:#{secert_key}")
    update_json = Faraday.new("https://accounts.spotify.com/api/token").post do |req|
      req.headers['Authorization'] = "Basic #{enigma}"
      req.body = { grant_type: "refresh_token", refresh_token: user.refresh_token}
    end
    json_parse(update_json.body)
  end

  private

    attr_reader :conn, :api_key, :secert_key

end
