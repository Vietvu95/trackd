require "json"
require "open-uri"
class AssetsController < ApplicationController

  url = “https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=#{ENV['API_KEY']}”
    #url = “https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=9da0f106-d8b3-4138-865c-09975e3c1f58”
    uri = URI.open(url).read
    @tickers = JSON.parse(uri)

  def index
    @assets = Asset.all
  end

  def edit
    @asset = Asset.find(params[:id])
  end

  def update
    @asset = Asset.find(params[:id])
    @asset.update(asset_params)
    redirect_to portfolio_path(@asset.portfolio)
  end

end
