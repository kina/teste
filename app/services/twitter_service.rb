class TwitterService
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key    = Rails.application.secrets.twitter_consumer_key
      config.consumer_secret = Rails.application.secrets.twitter_consumer_secret
    end   
  end

  def user_timeline(name)
    @client.user_timeline(name,count: 25)
  rescue Twitter::Error::NotFound
    raise  "#{name} not found"
  rescue Twitter::Error::Unauthorized
    raise  "Unauthorized to see #{name} tweets."
  end
end
