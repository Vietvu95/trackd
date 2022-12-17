require "json"
require "open-uri"
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # url = "http://api.marketstack.com/v1/eod?access_key=0f7424aef84ceea4f0ac1b4db80ec5c5&symbols=AAPL"
    # user_serialized = URI.open(url).read
    # @user = JSON.parse(user_serialized)
  end
end
