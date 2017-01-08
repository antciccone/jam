class Categories

  attr_reader :name, :image

  def initialize(service)
    @name   = service[:name]
    @image = service[:icons].first[:url]
  end

  def self.users_top_categories(user)
    SpotifyService.new.top_categories(user).map do |raw_info|
      Categories.new(raw_info)
    end
  end
end
