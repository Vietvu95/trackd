class PortfolioAssetsController < ApplicationController
  def create
    @portfolio_asset = PortfolioAsset.new(portfolio_asset_params)
    @portfolio = Portfolio.find(params[:portfolio_id])
    @portfolio_asset.portfolio = @portfolio
    @portfolio_asset.purchase_price = @portfolio_asset.calculate_purchase_price(@portfolio_asset.purchase_price)
    if @portfolio_asset.save
      redirect_to portfolio_path(@portfolio)
    else
      render :new
    end
  end

  private

  def portfolio_asset_params
    params.require(:portfolio_asset).permit(:quantity, :asset_id, :purchase_price)
  end
end
