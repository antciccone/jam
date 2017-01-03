class UsersController < ApplicationController

  def show
    @top_artists = TopArtists.users_top_artists(current_user)
  end

end
