class UsersController < ApplicationController
    def new
      
    end

    def show
        @tweet = Tweet.new
        @user = User.find(params[:id])
        @tweets = @user.tweets.order('created_at DESC')
    end
end
