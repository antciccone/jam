# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'support/factory_girl'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:spotify] = OmniAuth::AuthHash.new({"provider"=>"spotify",
 "uid"=>"cliff232",
 "info"=>
  {"name"=>"Cliff Nadaner",
   "nickname"=>"cliff232",
   "email"=>"cnadaner@aol.com",
   "urls"=>{"spotify"=>"https://open.spotify.com/user/cliff232"},
   "image"=>"https://scontent.xx.fbcdn.net/v/t1.0-1/s200x200/13879222_10157214803330576_399774410982109080_n.jpg?oh=b7bfdfb0004c3c8a978527164126c17a&oe=58EFBFF4"},
 "credentials"=>
  {"token"=>
    "#{ENV['USER_TOKEN']}",
   "refresh_token"=>"AQBHChDAAzOr4puewcHXbAxuYuJ-zZKsj8zZ1OmMn5oqV6lCsAYNXgdDlKdsmNUmqPD_yVHwx5qAsEaJwAjhNFsdERFnsTZXoz7TaLyOh3QOieOA7VughMX8Lkan0wsqKVk",
   "expires_at"=>1483479720,
   "expires"=>true},
 "extra"=>
  {"raw_info"=>
    {"country"=>"US",
     "display_name"=>"Cliff Nadaner",
     "email"=>"cnadaner@aol.com",
     "external_urls"=>{"spotify"=>"https://open.spotify.com/user/cliff232"},
     "followers"=>{"href"=>nil, "total"=>2},
     "href"=>"https://api.spotify.com/v1/users/cliff232",
     "id"=>"cliff232",
     "images"=>
      [{"height"=>nil,
        "url"=>"https://scontent.xx.fbcdn.net/v/t1.0-1/s200x200/13879222_10157214803330576_399774410982109080_n.jpg?oh=b7bfdfb0004c3c8a978527164126c17a&oe=58EFBFF4",
        "width"=>nil}],
     "product"=>"premium",
     "type"=>"user",
     "uri"=>"spotify:user:cliff232"}}})
  end

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end
