# TweetsControllerの定義
class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.order('created_at DESC')

  end

  def create
    Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text, :image)
  end
end
