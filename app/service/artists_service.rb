class ArtistsService

  def initialize
    @conn = Faraday.new(url: 'http://api.bandsintown.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def concerts(artist, lat, long)
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

  

  private

  attr_reader :conn
end
