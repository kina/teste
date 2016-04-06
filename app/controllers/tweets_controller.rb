class TweetsController < ApplicationController
#before_action :authenticate_user!

  # GET /tweets
  def index
    @tweets = []
    if params[:user_name]
      begin
        @tweets = TwitterService.new.user_timeline(params[:user_name])
      rescue Exception => e
        flash.now[:error] = e.message
      end
    end
    @tweets
  end
end
