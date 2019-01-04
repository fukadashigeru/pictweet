class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
    # @tweets = Tweet.all.order("created_at DESC").page(params[:page]).per(5)
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end
  def new
  end
  def create
    # Tweet.create(tweet_params)
    # binding.pry
    # Tweet.create(name: tweet_params[:name], image: tweet_params[:image], text: tweet_params[:text],user_id:current_user.id)
    # a=Tweet.create(tweet_params)
    # a.user_id = current_user.id
    # a.save
    Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
  end
  def destroy
    # binding.pry
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.destroy
    end
  end
  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
    end
  end
  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
  end

  private
  def tweet_params
    # params.permit(:name,:image,:text)
    params.permit(:image, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  # def destroy
  #   a = params[:id]
  #   binding.pry
  #   tweet = Tweet.find(params[:id])
  #   if tweet.user_id == current_user.id
  #      tweet.destory
  #   end
  # end

  # def destory
  #   tweet = Tweet.find(params[:id])
  #   tweet.destory if tweet.user_id == current_user.id
  # end
end
