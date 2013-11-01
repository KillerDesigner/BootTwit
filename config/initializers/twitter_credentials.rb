require 'twitter'

  Twitter.configure do |config|
    config.consumer_key = ENV[TWIT_KEY]
    config.consumer_secret = ENV[TWIT_SECRET]
    config.oauth_token = ENV[TWIT_A_TOKEN]
    config.oauth_token_secret = ENV[TWIT_TOKEN_SECRET]
  end