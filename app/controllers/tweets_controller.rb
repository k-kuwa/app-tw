class TweetsController < ApplicationController
    def index
        @tweets = Tweet.all.order('created_at DESC')
      end

    def create
        Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
        redirect_to user_path(id: current_user.id), notice: '投稿しました。'
    end

    def show
        @tweet = Tweet.find(params[:id])
        @comment = Comment.new
        @comments = @tweet.comments.includes(:user).order('created_at DESC')
    end

    def destroy
        tweet = Tweet.find(params[:id])
        if tweet.user_id == current_user.id
            tweet.destroy
            redirect_to user_path(id: current_user.id), notice: '削除しました。'
        end
    end

    private

    def tweet_params
        params.require(:tweet).permit(:text, :image)
    end
end
