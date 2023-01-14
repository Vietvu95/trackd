class PortfoliosController < ApplicationController
   before_action :set_portfolio, only: [:show, :edit, :update, :destroy]

  def index
    @portfolios = Portfolio.all
  end

  def new
    if params[:query].present?
      begin
         @assets = MarketStackApiManager.new(params[:query]).get_data
      rescue => e
          @error = "not valid ticker"
      end
      if @error == "not valid ticker"
        begin
          @assets = CoinMarketCapApiManager.new(params[:query]).get_data
        rescue => e
          @error = "second API invalid"
        end
      end
    end
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    @portfolio.user = current_user
    if @portfolio.save
      redirect_to portfolio_path(@portfolio)
    else
      render :new
    end
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    #@portfolio_assets = @porfolio&.portfolio_assets&.any? ? @portfolio.portfolio_assets : []
    @portfolio_asset = PortfolioAsset.new
    if params[:query].present?
      # @assets = MarketStackApiManager.new(params[:query]).get_data
      begin
        api= MarketStackApiManager.new(params[:query])
        @assets = api.data
      rescue => e
        @error = "first api invalid"
      end
      if @error == "first api invalid" || @assets["data"].empty?
        begin
          api = CoinMarketCapApiManager.new(params[:query])
          @assets = api.data
        rescue => e
          @error = "second API invalid"
        end
     end
      @asset_name = api.get_name
      @asset_price = api.get_price
      @asset = Asset.find_or_create_by_name(@asset_name)
     else
       @message = "Please enter a ticker"
    end
    @portfolio_asset = PortfolioAsset.new
  end

  private
  def portfolio_params
    params.require(:portfolio).permit(:name)
  end

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end
end
