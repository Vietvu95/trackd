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
  end
end
