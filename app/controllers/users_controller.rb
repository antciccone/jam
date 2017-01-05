class UsersController < ApplicationController
  before_action :all_genres
  def show
    @top_artists = TopArtists.users_top_artists(current_user)
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
