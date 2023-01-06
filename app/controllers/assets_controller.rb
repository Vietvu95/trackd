require "json"
require "open-uri"

class AssetsController < ApplicationController
  url = “https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=#{ENV['API_KEY']}”
    uri = URI.open(url).read
    @tickers = JSON.parse(uri)

  def edit
    @asset = Asset.find(params[:id])
  end

  def update
    @asset = Asset.find(params[:id])
    @asset.update(asset_params)
    redirect_to portfolio_path(@asset.portfolio)
  end
end
