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

    # diplay data
    #@markets = MarketStackApiManager.new(params[:query]).get_data
    @coins = ['BTC', 'ETH', 'USDT', 'BNB', 'USDC']
    @coins.map! do |coin_name|
      data = CoinMarketCapApiManager.new(coin_name).get_data["data"]

      info_hash = data.values.first
    end
    @markets = MarketStackManager.raw_data
    @tickers = MarketCoinManager.raw_data
    # end of display data

    # Search funcs
    @api_results = params[:query] ? api_search : {}
    # End of search funcs{}


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



  private

  def api_search
    if params[:query].present?
      begin
         return MarketStackApiManager.new(params[:query]).get_data
      rescue => e
          @error = "not valid ticker"
      end
      if @error == "not valid ticker"
        begin
          return CoinMarketCapApiManager.new(params[:query]).get_data
        rescue => e
          @error = "second API invalid"
          return nil
        end
      end
    end
  end
end
