class PortfolioAssetsController < ApplicationController
  def create
    @portfolio_asset = PortfolioAsset.new(portfolio_asset_params)
    @portfolio = Portfolio.find(params[:portfolio_id]) || current_user.portfolios.first
    @portfolio_asset.portfolio = @portfolio
    if @portfolio_asset.save
      redirect_to dashboard_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def portfolio_asset_params
    params.require(:portfolio_asset).permit(:quantity, :asset_id, :purchase_price, :name)
  end
end
