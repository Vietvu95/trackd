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
      @symbol = params[:query].upcase
      @stock_ticker = StockApiManager.new(params[:query]).get_stock_data
      @market_cap_ticker = MarketStackApiManager.new(params[:query]).get_data
    end
  end
end
