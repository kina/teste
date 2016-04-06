class TweetDecorator < Draper::Decorator
  delegate_all

  def time
    created_at.strftime "%d/%m/%Y %H:%M"
  end
end
