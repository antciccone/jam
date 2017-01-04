class ConcertsController < ApplicationController
  before_action :find_all_artists

  def index
    @concerts = ArtistConcerts.top_artists_concerts(params[:name], "40.7128", "-74.0059")
    @concertrecommendation = ConcertRecommendation.artist_concert_recommendation(params[:name], "40.7128", "-74.0059")
    @all_concerts = AllConcerts.all_artist_concerts(params[:name])
  end

  private

    def find_all_artists
      @artist = TopArtists.users_top_artists(current_user).reduce([]) do |array, artist|
        array << artist if artist.name == params[:name]
        array
      end
    end
end
