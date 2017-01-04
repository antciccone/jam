class ConcertsController < ApplicationController

  def index
    @artists = TopArtists.users_top_artists(current_user)
    @concerts = ArtistConcerts.top_artists_concerts(params[:name], "40.7128", "-74.0059")
    @concertrecommendation = ConcertRecommendation.artist_concert_recommendation(params[:name], "40.7128", "-74.0059")
  end

end
