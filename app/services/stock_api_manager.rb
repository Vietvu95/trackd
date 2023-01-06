class StockApiManager
  def initialize(asset_stock)
    @asset_stock = asset_stock
  end

  def stock_api_key
    ENV["STOCK_API_KEY"]
  end

  def get_stock_data
      stock_url = "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=#{@asset_stock}&interval=5min&apikey=stock_api_key"
      stock_serialized = URI.open(stock_url).read
      JSON.parse(stock_serialized)
  end
end
