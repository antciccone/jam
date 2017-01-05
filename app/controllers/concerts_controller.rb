class ConcertsController < ApplicationController
  before_action :find_all_artists


  def index
    @concerts = ArtistConcerts.top_artists_concerts(params[:name], current_user.latitude, current_user.longitude)
    @concertrecommendation = ConcertRecommendation.artist_concert_recommendation(params[:name], current_user.latitude, current_user.longitude)
    @all_concerts = AllConcerts.all_artist_concerts(params[:name])
    if @concerts == []
      flash[:success] = "There are no concerts for #{params[:name]} in your area"
    end
  end

  private

    def find_all_artists
      @artist = TopArtists.users_top_artists(current_user).reduce([]) do |array, artist|
        array << artist if artist.name == params[:name]
        array
      end
    end
end
