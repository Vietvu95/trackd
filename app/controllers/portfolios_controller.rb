class PortfoliosController < ApplicationController
  # before_action :set_portfolio, only: [:new, :create, :show, :edit, :update, :destroy]

  def index
    @portfolios = Portfolio.all
  end

  def new
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
    @portfolio = Portfolio.new
    @portfolio.name = @assets["data"].first["symbol"]
    @portfolio.user = current_user
  end

  def create
    @portfolio = Portfolio.new
    @portfolio.user = current_user
    @portfolio.name = @assets
    if @portfolio.save
      redirect_to portfolio_path(@portfolio)
    else
      render :new
    end
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    @portfolio_assets = @portfolio.portfolio_assets
  end



  private
  def portfolio_params
    params.require(:portfolio).permit(:name, :portfolio_value)
  end

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end
end
