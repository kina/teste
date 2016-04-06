class TweetsController < ApplicationController

  # GET /tweets
  def index
    @tweets = []

    respond_to do |format|
      format.html
    end
  end



  private
    # Only allow a trusted parameter "white list" through.
    def tweet_params
      params[:tweet]
    end
end
