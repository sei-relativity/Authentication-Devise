class TweetsController < ApplicationController
    before_action :is_owner, only: [:destroy]
    def index 
        @tweets = Tweet.all
    end

    def new
        @tweet = Tweet.new
    end

    def create
        if user_signed_in?
        @tweet = current_user.tweets.create(tweets_params)
        if @tweet.save
            redirect_to tweets_path   
        else
              render :new 
          end
        else
            redirect_to new_user_session_path
        end
    end

    def destroy
        Tweet.find(params[:id]).destroy
        redirect_to tweets_path
    end


    private
    def tweets_params
        params.require(:tweet).permit(:body)
    end

    def is_owner
        if user_signed_in?
            if current_user.id == Tweet.find(params[:id]).user_id
                return true
            else
                redirect_to tweets_path
            end
         else
            redirect_to tweets_path
        end
    end
end
