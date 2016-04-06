class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = []
    if params[:user_name]
      begin
        @tweets = TweetDecorator.decorate_collection(TwitterService.new.user_timeline(params[:user_name]))
      rescue Exception => e
        flash.now[:error] = e.message
      end
    end
  end
end
