Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['SAKURA_TWITTER_CONSUMER_KEY'], ENV['SAKURA_TWITTER_CONSUMER_SECRET']
end
