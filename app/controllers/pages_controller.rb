require "json"
require "open-uri"
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @assets = Asset.all
    # if params[:query].present?
    #   begin
    #     # @assets = MarketStackApiManager.new(params[:query]).get_data
    #   rescue => e
    #     @error = "not valid ticker"
    #   end
    # end
    begin
      #res = URI.open("https://api.marketaux.com/v1/news/all?api_token=#{ENV['MARKETAUX_API_KEY']}&language=en").read
      res = URI.open("https://api.thenewsapi.com/v1/news/all?api_token=82wXWJJM3Jk4kGU4cQf7YZMSgJ5q4KV0NGDkk8gl&language=en").read
      @thenewsapi_hash = JSON.parse(res)
    rescue => exception
      @thenewsapi_hash = {"data" => []}
    end
  end

  def assets_search
    if params[:query].present?
      redirect_to assets_path
      # @assets = MarketStackApiManager.new(params[:query]).get_data
    # else
    #   @message = "Please enter a ticker"
    end
  end

  def assets
    @assets = Asset.all
  end
end
