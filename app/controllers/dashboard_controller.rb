class DashboardController < ApplicationController
  def dashboard
    @total_current_value = current_user.total_portfolios_value.round(2)
    @total_purchase_value = current_user.total_portfolios_purchase_value.round(2)
    @total_pl = (@total_current_value - @total_purchase_value).round(2)
    @portfolio_assets = current_user.portfolio_assets
    @portfolio = current_user.portfolios.first
    @portfolio_asset = PortfolioAsset.new

    # @portfolio = Portfolio.find(current_user.portfolios.first.id)
    # @portfolio_asset = PortfolioAsset.new
    # if params[:query].present?
    #   begin
    #     api = CoinMarketCapApiManager.new(params[:query])
    #     @assets = api.data
    #   rescue => e
    #     @error = "first api invalid"
    #   end
    #   if @error == "first api invalid" || @assets["data"].empty?
    #     begin
    #       api= MarketStackApiManager.new(params[:query])
    #       @assets = api.data
    #     rescue => e
    #       @error = "second API invalid"
    #     end
    #  end
    #   @asset_name = api.get_name
    #   @asset_price = api.get_price
    #   @asset = Asset.find_or_create_by_name(@asset_name)
    #  else
    #    @message = "Please enter a ticker"
    # end
    # @portfolio_asset = PortfolioAsset.new
  end

  def add_to_portfolio
  #   @portfolio_asset = PortfolioAsset.new(portfolio_asset_params)
  #   @portfolio = Portfolio.find(current_user.portfolios.firs)
  #   @portfolio_asset.portfolio = @portfolio
  #   @portfolio_asset.purchase_price = @portfolio_asset.calculate_purchase_price(@portfolio_asset.purchase_price)
  #   if @portfolio_asset.save
  #     redirect_to portfolio_path(@portfolio)
  #   else
  #     render :new
  #   end
  end
end
