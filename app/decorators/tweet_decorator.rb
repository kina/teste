class TweetDecorator < Draper::Decorator
  delegate_all

  def time
    created_at.strftime "%d/%m/%Y %H:%M"
  end


  def text
    object.text.gsub(MENTION_REGULAR_EXPRESSION, h.link_to('\0', "#{TWITTER_URL+'\1'}") )
  end

  private
  MENTION_REGULAR_EXPRESSION = /@([a-zA-Z0-9_\-]+)/i #/\B\@([\w\-]+)/i
  TWITTER_URL = 'http://www.twitter.com/'
end
