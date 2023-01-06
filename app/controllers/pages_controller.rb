require "json"
require "open-uri"


class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  # def home
  #   if params[:query].present?
  #     begin
  #       @assets = MarketStackApiManager.new(params[:query]).get_data
  #     rescue => e
  #       @error = "not valid ticker"
  #     end
  #   end

   def home
    if params[:query].present?
      begin
        @stock_ticker = StockApiManager.new(params[:query]).get_stock_data
      rescue => e
        @error = "not valid ticker"
      end
    end

    myurl = 'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=AAPL&interval=5min&apikey=L73EE7ZUNUZ4DKW0'
    test = URI.open(myurl).read
      @hello = JSON.parse(test)


  end
end
