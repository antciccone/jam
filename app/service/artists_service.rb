class ArtistsService

  def initialize
    @conn = Faraday.new(url: 'http://api.bandsintown.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def concerts(artist, lat, long)
    artist = artist.split.join('%20')
    concerts_json = conn.get do |req|
      req.url "artists/#{artist}/events/search"
      req.params['api_version'] = '2.0'
      req.params['app_id'] = 'jam'
      req.params['location'] = "#{lat},#{long}"
      req.params['radius'] = '150'
      req.params['format'] = 'json'
    end
    json_parse(concerts_json.body)
  end

  def recommended_concerts(artist, lat, long)
    artist = artist.split.join('%20')
    concerts_json = conn.get do |req|
      req.url "artists/#{artist}/events/recommended"
      req.params['api_version'] = '2.0'
      req.params['app_id'] = 'jam'
      req.params['location'] = "#{lat},#{long}"
      req.params['radius'] = '150'
      req.params['format'] = 'json'
    end
    json_parse(concerts_json.body)
  end

  def all_concerts(artist)
    artist = artist.split.join('%20')
    concerts_json = conn.get do |req|
      req.url "artists/#{artist}/events"
      req.params['api_version'] = '2.0'
      req.params['app_id'] = 'jam'
      req.params['format'] = 'json'
    end
    json_parse(concerts_json.body)
  end

  def json_parse(concerts_json)
    JSON.parse(concerts_json, symbolize_names: true)
  end

  private

    attr_reader :conn
end
