class TweetsController < ApplicationController

    before_action :authenticate

    def authenticate
      redirect_to new_user_path unless user_signed_in?
    end


    def index
        @tweets = Tweet.all.order('created_at DESC')
        @tweet = Tweet.new
    end

    def home

    end

    def create
        Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
        redirect_to root_path, notice: '投稿しました。'
    end

    def show
        @tweets = Tweet.all
        @tweet = Tweet.find(params[:id])
        @comment = Comment.new
        @comments = @tweet.comments.includes(:user).order('created_at DESC')
    end

    def destroy
        tweet = Tweet.find(params[:id])
        if tweet.user_id == current_user.id
            tweet.destroy
            redirect_to root_path, notice: '削除しました。'
        end
    end

    private

    def tweet_params
        params.require(:tweet).permit(:text, :image)
    end
end
