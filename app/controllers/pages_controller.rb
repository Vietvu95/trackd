require "json"
require "open-uri"
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:query].present?
      tickers = params[:query]
      begin
        url = "http://api.marketstack.com/v1/eod?access_key=0f7424aef84ceea4f0ac1b4db80ec5c5&symbols=#{tickers}"
        assets_serialized = URI.open(url).read
        @assets = JSON.parse(assets_serialized)
      rescue => e
        @error = "not valid ticker"
      end
    end
  end
end
