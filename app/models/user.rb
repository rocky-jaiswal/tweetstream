class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User
  before_create :skip_confirmation!
end

# client = Twitter::REST::Client.new do |config|
#   config.consumer_key        = ENV["TWITTER_API_KEY"]
#   config.consumer_secret     = ENV["TWITTER_API_SECRET"]
#   config.access_token        = User.first.oauth_access_token
#   config.access_token_secret = User.first.oauth_access_token_secret
# end

# client.home_timeline({count: 10, contributor_details: true})
