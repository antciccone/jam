class User < ApplicationRecord

  def self.from_omniauth(auth_info, lat, long)
    require "pry"; binding.pry
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid           = auth_info.uid
      new_user.latitude      = lat
      new_user.longitude     = long
      new_user.name          = auth_info[:info][:name]
      new_user.nickname      = auth_info[:info][:nickname]
      new_user.email         = auth_info[:info][:email]
      new_user.spotify       = auth_info[:info][:urls][:spotify]
      new_user.image         = auth_info[:info][:image]
      new_user.token         = auth_info[:credentials][:token]
      new_user.url           = auth_info[:extra][:raw_info][:href]
      new_user.refresh_token = auth_info[:credentials][:refresh_token]
      new_user.token_expire  = auth_info[:credentials][:expires_at]
    end
  end

  def user_refresh_token
    new_token = SpotifyService.new.update_token(self)
    self.update(token: new_token[:access_token])
  end
end
