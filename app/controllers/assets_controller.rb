require "json"
require "open-uri"
class AssetsController < ApplicationController

  def edit
    @asset = Asset.find(params[:id])
  end

  def update
    @asset = Asset.find(params[:id])
    @asset.update(asset_params)
    redirect_to portfolio_path(@asset.portfolio)
  end
end
