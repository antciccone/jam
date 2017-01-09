class UsersController < ApplicationController
  before_action :all_genres

  def show
    @top_artists = TopArtists.users_top_artists(current_user)
    @top_albums = TopAlbums.users_top_albums(current_user)
  end

  def artist
    @top_artists = TopArtists.users_top_artists(current_user)
  end

  def tracks
    @top_tracks = TopTracks.user_top_tracks(current_user)
  end

  private

  def all_genres
     TopArtists.users_top_artists(current_user).each do |artist|
    @all_genres = artist.genres.reduce([]) do |array, genres|
        array << genres
        array
      end
    end
  end
end
