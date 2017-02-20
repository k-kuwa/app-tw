class UsersController < ApplicationController
    def show
        @tweet = Tweet.new
        @user = User.find(params[:id])
        @tweets = @user.tweets.order('created_at DESC')
    end
end
