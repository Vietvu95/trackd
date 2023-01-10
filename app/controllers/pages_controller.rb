require "json"
require "open-uri"
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:query].present?
      begin
        @assets = MarketStackApiManager.new(params[:query]).get_data
      rescue => e
        @error = "not valid ticker"
      end
    end
    begin
      res = URI.open("https://api.marketaux.com/v1/news/all?api_token=#{ENV['MARKETAUX_API_KEY']}&language=en").read
      @marketaux_hash = JSON.parse(res)
    rescue => exception
      @marketaux_hash = {"data" => []}
    end
  end
end
