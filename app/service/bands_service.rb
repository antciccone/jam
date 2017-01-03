class ArtistsService

  def initialize
    @conn = Faraday.new(url: 'http://api.bandsintown.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def 

  private

  attr_reader :conn
end
